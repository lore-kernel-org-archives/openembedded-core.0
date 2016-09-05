Return-Path: <joshuagloe@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CD1F7773C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 15:49:17 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id w207so27886642wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8PsijsAooaVzNHdHjxDjYI2tXQ4BjFW04EmZSggqNcw=;
	b=c3Tft2doMbQ/Qp8m1KTyk7J4WDdFAQErHxk5rVAZjx9aJkoQGcxBDU59w758EIW2Uz
	WHMmjC+cNOOSb2FvxumW551T8jSAUykzEYkxRHwjSNRZVcB3QP+gXxX+KCBZLxniuIXS
	VUXr5kGvMM+ef6Eb9Ee0dxoIXBnwnfUDtkqlZ1QeZZ7EyCW6RqdfWpzn8Y2d6PsP/y46
	K1qT6OuLlRjRMO7gJpWekUPnyRmsUh0Xfzrm3LzFJTuuHNMyO+PjdWNsBJS+bJZZfShF
	VjCNBBk3zL2dn/PCy5G7BwITzRFCegpoXZkv6fWp9B+mHOHcS1P1uc6SbNXKuzbNGd0z
	Xjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8PsijsAooaVzNHdHjxDjYI2tXQ4BjFW04EmZSggqNcw=;
	b=Ik/8g2Aq41vtETLm8L/5f+Ie3eB79PMgM9kAzGC2tcTQGUI5ILxINBNBpORK9jhSyA
	wI+LeW9G4nvXwnGkobTLQdG/BLFXKeEWSmVKwX3N36/bsoIfteFkLBDAb0qNaCYYc7p5
	os2EDnhvh2qKxKvg3xtf+aLa6Qi9LDgz2fQJEhVRI32oGhXg678Qmb+L2uJlrwsBz3K0
	k9lWmDA4JR5twNaiTfKHzQHrjNFaeQ1uNkNBWbkWEROpI6T40+/+DfzgeDvVzZqK4BAj
	5Wlo1mi6qIQ4VvvCPsxjNWrh+w8AQ5Io1ucE9F9YZqsUJu/EauoWH53UV5p80TboiadG
	esvg==
X-Gm-Message-State: AE9vXwOL5snBInhvjuBbMXAmVSCH+iB/Yqy1kDrZ8t29//1A77O1aeRo+SUlA0qk42FBvDU7GNGCrW6+t4N1VQ==
X-Received: by 10.28.169.142 with SMTP id s136mr10698060wme.95.1473090557816; 
	Mon, 05 Sep 2016 08:49:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.8.135 with HTTP; Mon, 5 Sep 2016 08:49:17 -0700 (PDT)
In-Reply-To: <a08a52ab-c834-d104-695f-491d297a4e1d@windriver.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
	<6180658762c54732ad9d8db624f2f0502996ff9b.1473083836.git.joshua.g.lock@intel.com>
	<a08a52ab-c834-d104-695f-491d297a4e1d@windriver.com>
From: Joshua Lock <joshuagloe@gmail.com>
Date: Mon, 5 Sep 2016 16:49:17 +0100
Message-ID: <CAK-Jx1MOVXS2DnNeqeGeqZ4cSL0C0aT1TgGWfSQfzvTOLBZNGQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] runqemu: get NATIVE dirs from env when in source OE build dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Sep 2016 15:49:19 -0000
Content-Type: multipart/alternative; boundary=001a114b9c926bbea0053bc49fef

--001a114b9c926bbea0053bc49fef
Content-Type: text/plain; charset=UTF-8

On 5 September 2016 at 15:47, Robert Yang <liezhi.yang@windriver.com> wrote:

> Hi Josh,
>
> Thanks for fixing this, I got errors when test this patch:
>
> $ runqemu tmp/deploy/images/qemux86/
> runqemu - INFO - Running bitbake -e...
> Traceback (most recent call last):
>   File "/buildarea/lyang1/poky/scripts/runqemu", line 864, in <module>
>     ret = main()
>   File "/buildarea/lyang1/poky/scripts/runqemu", line 851, in main
>     config.read_qemuboot()
>   File "/buildarea/lyang1/poky/scripts/runqemu", line 536, in
> read_qemuboot
>     self.qemuboot = qbs.split[0]
> AttributeError: 'list' object has no attribute 'split'
>

Thanks for reviewing and catching this.


> And after your patches, it always need run "bitbake -e", this makes
> us can't use runqemu when another build is running:
> ERROR: Only one copy of bitbake should be run against a build directory
>
> Maybe we check STAGING_DIR_NATIVE, STAGING_BINDIR_NATIVE
> and STAGING_DIR_HOST, if they are existed, then we don't need run bitbake
> -e.
>

That's a nice idea, I'll implement that for v2 of the series.


> And please see my comments below.
>
>
> On 09/05/2016 09:59 PM, Joshua Lock wrote:
>
>> When we're running from a sourced OE build directory parse the
>> STAGING_* directories from the bitbake environment, rather than
>> using those hard-coded in the conf file.
>>
>> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>> ---
>>  scripts/runqemu | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index cfe7bff..5a97802 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -555,6 +555,16 @@ class BaseConfig(object):
>>                  logger.info('Setting DEPLOY_DIR_IMAGE to folder
>> containing %s (%s)' % (self.qemuboot, imgdir))
>>                  self.set('DEPLOY_DIR_IMAGE', imgdir)
>>
>> +        # When we're running from a sourced OE environment use the
>> STAGING_*
>> +        # directories from the environment.
>> +        if self.bitbake_e:
>> +            native_vars = ['STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE']
>> +            for nv in native_vars:
>> +                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
>> +                if s and s.group(1) != self.get(nv):
>> +                    logger.info('Overriding conf file setting of %s to
>> %s from Bitbake environment' % (nv, s.group(1)))
>> +                    self.set(nv, s.group(1))
>> +
>>      def print_config(self):
>>          logger.info('Continuing with the following parameters:\n')
>>          if not self.fstype in self.vmtypes:
>> @@ -815,6 +825,17 @@ class BaseConfig(object):
>>              shutil.rmtree(self.nfs_dir)
>>              shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
>>
>> +    def check_sourced_env(self):
>> +        bitbake = shutil.which('bitbake')
>> +        if bitbake and not self.bitbake_e:
>> +            mach = self.get('MACHINE')
>> +            if mach:
>> +                cmd = 'MACHINE=%s bitbake -e' % mach
>> +            else:
>> +                cmd = 'bitbake -e'
>> +            logger.info('Running %s...' % cmd)
>> +            self.bitbake_e = subprocess.Popen(cmd, shell=True,
>> stdout=subprocess.PIPE).stdout.read().decode('utf-8')
>>
>
> I think that we need check whether the command is successed
> or not, and print errors if it is failed to run.
>

Sure, I'll implement that.

Joshua <joshua.g.lock@intel.com>

--001a114b9c926bbea0053bc49fef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 September 2016 at 15:47, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_=
quote">Hi Josh,<br>
<br>
Thanks for fixing this, I got errors when test this patch:<br>
<br>
$ runqemu tmp/deploy/images/qemux86/<br>
runqemu - INFO - Running bitbake -e...<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/buildarea/lyang1/poky/script<wbr>s/runqemu&quot;, line 8=
64, in &lt;module&gt;<br>
=C2=A0 =C2=A0 ret =3D main()<br>
=C2=A0 File &quot;/buildarea/lyang1/poky/script<wbr>s/runqemu&quot;, line 8=
51, in main<br>
=C2=A0 =C2=A0 config.read_qemuboot()<br>
=C2=A0 File &quot;/buildarea/lyang1/poky/script<wbr>s/runqemu&quot;, line 5=
36, in read_qemuboot<br>
=C2=A0 =C2=A0 self.qemuboot =3D qbs.split[0]<br>
AttributeError: &#39;list&#39; object has no attribute &#39;split&#39;<br><=
/blockquote><div><br></div><div>Thanks for reviewing and catching this.<br>=
</div><div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
And after your patches, it always need run &quot;bitbake -e&quot;, this mak=
es<br>
us can&#39;t use runqemu when another build is running:<br>
ERROR: Only one copy of bitbake should be run against a build directory<br>
<br>
Maybe we check STAGING_DIR_NATIVE, STAGING_BINDIR_NATIVE<br>
and STAGING_DIR_HOST, if they are existed, then we don&#39;t need run bitba=
ke -e.<br></blockquote><div><br></div><div>That&#39;s a nice idea, I&#39;ll=
 implement that for v2 of the series.<br></div><div>=C2=A0</div><blockquote=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex" class=3D"gmail_quote">
And please see my comments below.<div><div><br>
<br>
On 09/05/2016 09:59 PM, Joshua Lock wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
When we&#39;re running from a sourced OE build directory parse the<br>
STAGING_* directories from the bitbake environment, rather than<br>
using those hard-coded in the conf file.<br>
<br>
Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.g.lock@intel.com" t=
arget=3D"_blank">joshua.g.lock@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 22 ++++++++++++++++++++++<br>
=C2=A01 file changed, 22 insertions(+)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index cfe7bff..5a97802 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -555,6 +555,16 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a rel=3D"nor=
eferrer" href=3D"http://logger.info" target=3D"_blank">logger.info</a>(&#39=
;Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)&#39; % (self.qemuboo=
t, imgdir))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set(&#39=
;DEPLOY_DIR_IMAGE&#39;, imgdir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # When we&#39;re running from a sourced OE env=
ironment use the STAGING_*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # directories from the environment.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.bitbake_e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_vars =3D [&#39;STAGING_DI=
R_NATIVE&#39;, &#39;STAGING_BINDIR_NATIVE&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for nv in native_vars:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D re.search(&#=
39;^%s=3D&quot;(.*)&quot;&#39; % nv, self.bitbake_e, re.M)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if s and s.group(1=
) !=3D self.get(nv):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a r=
el=3D"noreferrer" href=3D"http://logger.info" target=3D"_blank">logger.info=
</a>(&#39;Overriding conf file setting of %s to %s from Bitbake environment=
&#39; % (nv, s.group(1)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.set(nv, s.group(1))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def print_config(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a rel=3D"noreferrer" href=3D"http://logg=
er.info" target=3D"_blank">logger.info</a>(&#39;Continuing with the followi=
ng parameters:\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.fstype in self.vmtypes:<br>
@@ -815,6 +825,17 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(self.nfs_dir)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(&#39;%s.pseud=
o_stat<wbr>e&#39; % self.nfs_dir)<br>
<br>
+=C2=A0 =C2=A0 def check_sourced_env(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake =3D shutil.which(&#39;bitbake&#39;)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bitbake and not self.bitbake_e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mach =3D self.get(&#39;MACHINE&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mach:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;MACHI=
NE=3D%s bitbake -e&#39; % mach<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;bitba=
ke -e&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a rel=3D"noreferrer" href=3D"ht=
tp://logger.info" target=3D"_blank">logger.info</a>(&#39;Running %s...&#39;=
 % cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.bitbake_e =3D subprocess.Po=
pen(cmd, shell=3DTrue, stdout=3Dsubprocess.PIPE).stdout<wbr>.read().decode(=
&#39;utf-8&#39;)<br>
</blockquote>
<br></div></div>
I think that we need check whether the command is successed<br>
or not, and print errors if it is failed to run.<span><font color=3D"#88888=
8"><br></font></span></blockquote><div><br></div><div>Sure, I&#39;ll implem=
ent that.<br><br></div><div>Joshua &lt;<a href=3D"mailto:joshua.g.lock@inte=
l.com">joshua.g.lock@intel.com</a>&gt;<br></div></div><br></div></div>

--001a114b9c926bbea0053bc49fef--
