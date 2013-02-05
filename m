Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U2ldx-0005B8-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:45:31 +0100
Received: by mail-la0-f49.google.com with SMTP id fs13so364524lab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=gvlCMDMpwEEwP0xc4jNywQAF50KR1sNWanwIwzUISUw=;
	b=jbmYMYRsM/Dn0zuWgludKdOrMa1geZrgZR5Ms6JGeAszJhACRTUR0KZV+AlaoyeKOW
	hquLi6BTRwt2PPtsVThptXa/cp4anRGD7yNQo4H4U3ZPXMXFud3GAnD47YpUh1iY/QHF
	2eabF6hWng+UXzyjfGe9ZAyVW7cjIOCK4Yof/KEzSLsfpZl2B8BhWuMOVBM1hGqzi4OX
	nDPInuWZTijTxb7eeq5NdEl7lJuXU/h3oBx2GmhkBXJ03sc+zCRpGl7WLydsdnZEYczI
	g7jLEVSfoLKczq/vJ5FC/zKSGTLFygR2SXkNqiKo2DuOKi/sdE3+eM9qEUh/zm/SZfcr
	JhWg==
MIME-Version: 1.0
X-Received: by 10.152.147.103 with SMTP id tj7mr23685449lab.54.1360081763499; 
	Tue, 05 Feb 2013 08:29:23 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 5 Feb 2013 08:29:23 -0800 (PST)
In-Reply-To: <5110A9D1.20208@windriver.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
	<5110A9D1.20208@windriver.com>
Date: Tue, 5 Feb 2013 11:29:23 -0500
Message-ID: <CADkTA4MN+jzTZCLBK17mJvhvLbAB7yf-8Fr8bRBaM7c=b=_avw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:45:33 -0000
Content-Type: multipart/alternative; boundary=e89a8f234d2b60ff9b04d4fcb6bf

--e89a8f234d2b60ff9b04d4fcb6bf
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 1:42 AM, ChenQi <Qi.Chen@windriver.com> wrote:

>  On 02/02/2013 03:08 AM, Bruce Ashfield wrote:
>
>
>
>
> On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
>>
>>>
>>>
>>>
>>> On Fri, Feb 1, 2013 at 4:00 AM, <Qi.Chen@windriver.com
>>>  <mailto:Qi.Chen@windriver.com>> wrote:
>>>
>>>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>>>
>>>
>>>
>>>     Add config fragments to busybox.
>>>
>>>     Both the implementation and the use case are similar to yocto
>>> kernel's
>>>     configuration fragments.
>>>
>>>
>>> I can fairly easily tweak the configuration parts of the kern-tools to
>>> handle this
>>> use case as well. That would allow us to re-use the kernel's
>>> merge_config.sh
>>> script (with a minor dependency change) and save some duplicated code. It
>>> also gets you the advantage that you can consolidate configuration
>>> fragments
>>> outside of any build system, which isn't as critical here, but something
>>> that
>>> is used quite a bit during kernel testing.
>>>
>>>  Bruce,
>>
>> Where is the merge_config.sh script today?  Would you propose moving it
>> to the scripts dir and have the busybox recipe call it?
>>
>
>  It's part of the mainline kernel, hence why grabbing the guts out of it
> reproducing
> it here isn't the best idea, we'll have a need to keep them in sync. In
> fact, I have
> 2 or 3 pending patches for it in the kern-tools repository that I need to
> get upstream
>  (as an example).
>
>  I'd propose either creating a separate recipe for it (i.e. like
> kconfig-frontends) or I could
> keep it in kern-tools (badly named, but we can work on that ;) and
> maintain / coordinate
> changes to it.
>
>  I just don't want to see the effort happen twice, we are busy enough!
>
>
>>
>> What would be your timing on making such a change, ie hold this patch
>> until your get it merge or merge this and then fix it when you merge your
>> changes?
>>
>
>  I could feasibly get it done in the next few weeks, the changes aren't
> bug, I just
> have to avoid regressions on either side (kernel or busy box).
>
>  That being said, the interface to the SRC_URI is the same for the two,
> so if we are
> ok with me arriving and removing the in-recipe support, I guess I can't
> object too
> much :) The only risk is that if anyone starts using this first support
> immediately,
> I do risk regressing their use case, where if it never goes in, that won't
> happen.
>
>  Cheers,
>
>  Bruce
>
>
>
> Hi Bruce,
>
> I just tried to reuse the kernel's merge_config.sh script, and it turned
> out well.
> The patch is in attachment.
>
> Is it enough for now?
>

Yep, this is enough for now. It re-uses the significant part of the
infrastructure, which
is the important part. Once it is in tree, I can refine the dependency and
some other
minor modifications.

Feel free to add my Signed-off-by: to the patch as well.

Cheers,

Bruce


> If so, I'll send out the patch.
>
> Thanks,
> Chen Qi
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f234d2b60ff9b04d4fcb6bf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Feb 5, 2013 at 1:42 AM, ChenQi <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">
    <div>On 02/02/2013 03:08 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <br>
          <div class=3D"gmail_quote">On Fri, Feb 1, 2013 at 1:56 PM, Saul
            Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.co=
m" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div>On 02/01/2013 06:18 AM, Bruce Ashfield
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
                <div>
                  <br>
                  <br>
                  <br>
                  On Fri, Feb 1, 2013 at 4:00 AM, &lt;<a href=3D"mailto:Qi.=
Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a><br>
                </div>
                &lt;mailto:<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;&gt;
                wrote:<br>
                <br>
                =A0 =A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriv=
er.com" target=3D"_blank">Qi.Chen@windriver.com</a>
                &lt;mailto:<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;&gt;
                <div>
                  <br>
                  <br>
                  =A0 =A0 Add config fragments to busybox.<br>
                  <br>
                  =A0 =A0 Both the implementation and the use case are
                  similar to yocto kernel&#39;s<br>
                  =A0 =A0 configuration fragments.<br>
                  <br>
                  <br>
                  I can fairly easily tweak the configuration parts of
                  the kern-tools to<br>
                  handle this<br>
                  use case as well. That would allow us to re-use the
                  kernel&#39;s merge_config.sh<br>
                  script (with a minor dependency change) and save some
                  duplicated code. It<br>
                  also gets you the advantage that you can consolidate
                  configuration fragments<br>
                  outside of any build system, which isn&#39;t as critical
                  here, but something<br>
                  that<br>
                  is used quite a bit during kernel testing.<br>
                  <br>
                </div>
              </blockquote>
              Bruce,<br>
              <br>
              Where is the merge_config.sh script today? =A0Would you
              propose moving it to the scripts dir and have the busybox
              recipe call it?<br>
            </blockquote>
            <div><br>
            </div>
            <div>It&#39;s part of the mainline kernel, hence why
              grabbing the guts out of it reproducing=A0</div>
            <div>it here isn&#39;t the best idea, we&#39;ll have a need
              to keep them in sync. In fact, I have</div>
            <div>2 or 3 pending patches for it in the
              kern-tools repository that I need to get upstream</div>
            <div>
              (as an example).</div>
            <div><br>
            </div>
            <div>I&#39;d propose either creating a separate recipe
              for it (i.e. like kconfig-frontends) or I could</div>
            <div>keep it in kern-tools (badly named, but we can
              work on that ;) and maintain / coordinate</div>
            <div>changes to it.</div>
            <div><br>
            </div>
            <div>I just don&#39;t want to see the effort happen
              twice, we are busy enough!</div>
            <div>=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <br>
              What would be your timing on making such a change, ie hold
              this patch until your get it merge or merge this and then
              fix it when you merge your changes?<br>
            </blockquote>
            <div><br>
            </div>
            <div>I could feasibly get it done in the next few
              weeks, the changes aren&#39;t bug, I just</div>
            <div>have to avoid regressions on either side
              (kernel or busy box).=A0</div>
            <div><br>
            </div>
            <div>That being said, the interface to the SRC_URI
              is the same for the two, so if we are</div>
            <div>ok with me arriving and removing the in-recipe
              support, I guess I can&#39;t object too</div>
            <div>much :) The only risk is that if anyone starts
              using this first support immediately,=A0</div>
            <div>I do risk regressing their use case, where if
              it never goes in, that won&#39;t happen.</div>
            <div><br>
            </div>
            <div>Cheers,</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div><br>
            </div>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    Hi Bruce,<br>
    <br>
    I just tried to reuse the kernel&#39;s merge_config.sh script, and it
    turned out well.<br>
    The patch is in attachment.<br>
    <br>
    Is it enough for now?<br></div></blockquote><div><br></div><div style>Y=
ep, this is enough for now. It re-uses the significant part of the infrastr=
ucture, which</div><div style>is the important part. Once it is in tree, I =
can refine the dependency and some other</div>
<div style>minor modifications.</div><div style><br></div><div style>Feel f=
ree to add my Signed-off-by: to the patch as well.</div><div style><br></di=
v><div style>Cheers,</div><div style><br></div><div style>Bruce</div><div>
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#0=
00000">
    If so, I&#39;ll send out the patch.<br>
    <br>
    Thanks,<br>
    Chen Qi<br>
  </div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--e89a8f234d2b60ff9b04d4fcb6bf--
