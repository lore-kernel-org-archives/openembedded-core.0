Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id B27DB71B15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 04:27:18 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id y2so179808721oie.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2016 21:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=tBuCwoOA6Lzk5m0tPAZCjDMQd/oI2I7sqCVVJrj/RtE=;
	b=F6AWGmKLOiHcKH5QEbDR3lpCJxdL1fig/wD3D1IvFMHpopNRuH48+2+NkJ79us9swQ
	m1uX3Dt953YJOrrYEfnaJysJoE4lHB5ic3gTSQrxQRT1LbaovbqHK6NS7enQdwYmIGj2
	hbOXYwpZ6sT3ixk/A4EQaZpLgi2uJKEndHfjZcogbXtXOSvGmKansRUbOzozIeLbDjcQ
	8Ef8FABKGGxKhnWn9q77NP1zndE0lUZsfS/cofpbSXLfW35eVRZnR28i/egbWdUJ7mrY
	AtBF/jc8kig2smluKtCjZY9T2l/PCpDhfdoJ+0o/EEtVdPZgX6yxTCLTjX/r+1qj5Nzf
	0PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=tBuCwoOA6Lzk5m0tPAZCjDMQd/oI2I7sqCVVJrj/RtE=;
	b=UBNrUiW2w9P1slbbqvvQLot3O/usfgRvfP9/jHCyKwm4Z6+ZNWJUmmJ0eYpgn6hz5C
	GcuwBC6EYLeyrnhm7k+p+Kj47cqwl/fLnSkCT5Av8BCpP08PHG7fXN/7GOcCauwXA8hr
	2IpP8tQSuMAOca9uZPytH1zBoWOsWckpKMIpiH1oBVAg5bAZV4+pM1Aw0Y5n78AMVYt3
	mVfDqfQTfwumjd+munF+X9IP4jFyIXeIDPshzHqjfj/qUjB2zMfw3PGicHF3o2ARYZl9
	7Ugfj+bS4wsjtvWlpyl8t9s98RCUDTKTkhL28SXwtXBNNQ5wxxbFUStCQfPc2U2PsVxr
	tKew==
X-Gm-Message-State: AA6/9RnZOBGkx5fkBUMxV4Ie3I60MVWhvyW/oRyPsLG066smRzk1HXUFTW2uY4Gav4bwDNxJDH77xxni2/6xdA==
X-Received: by 10.202.171.15 with SMTP id u15mr11731854oie.11.1476592039959;
	Sat, 15 Oct 2016 21:27:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Sat, 15 Oct 2016 21:26:59 -0700 (PDT)
In-Reply-To: <f8b837c9-b252-751d-48b8-f3856a96160a@windriver.com>
References: <cover.1476351914.git.liezhi.yang@windriver.com>
	<5efcefb8fb966ad7c7a21a6c217db43199dd7b46.1476351914.git.liezhi.yang@windriver.com>
	<CAJTo0Lbruk380HCw_c_m5VR+RwT53XWSYGHSULhKH8ar3gQWVA@mail.gmail.com>
	<92bbcd5d-f7f4-47f7-96c9-635f0cea48ed@windriver.com>
	<f8b837c9-b252-751d-48b8-f3856a96160a@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 15 Oct 2016 21:26:59 -0700
X-Google-Sender-Auth: zBjFkaKSxrNVjQa7rd8qDU53QGc
Message-ID: <CABcZAN=o8j3NYmc1YihJPmS3Z05LMsgA9ZdaSBz_OMVWjvGQCg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_manager.py: fix for "Argument list too long"
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
X-List-Received-Date: Sun, 16 Oct 2016 04:27:18 -0000
Content-Type: multipart/alternative; boundary=001a113cd736052213053ef3e029

--001a113cd736052213053ef3e029
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 14, 2016 at 3:18 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> On 10/14/2016 05:58 PM, Robert Yang wrote:
>
>>
>>
>> On 10/13/2016 06:39 PM, Burton, Ross wrote:
>>
>>>
>>> On 13 October 2016 at 10:45, Robert Yang <liezhi.yang@windriver.com
>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>
>>>     This is because "copyhardlinktree(deploy_arch_dir, arch_channel)"
>>> does:
>>>     "cp -afl deploy_arch_dir/* arch_channel", while the
>>> deploy_arch_dir/* is
>>>     expanded to "deploy_arch_dir/pkg1 deploy_arch_dir/pkg2
>>>     deploy_arch_dir/pkg3 ..." which causes the "Argument list too long",
>>>     change cwd to deploy_arch_dir can avoid the error.
>>>
>>>
>>> Would it be better to change the implementation of copyhardlinktree so
>>> that it
>>> *can't* have this problem?
>>>
>>
>> Good idea, thanks, updated in the repo:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/long
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-cont
>> rib/log/?h=rbt/long
>>
>>
> Sorry, this patch is not what I wanted to paste, it should be:
>
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 06a5af2..1d9cca5 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -80,15 +80,20 @@ def copyhardlinktree(src, dst):
>          cmd = "cd %s; find . -type d -print | tar --xattrs
> --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar
> --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>          source = ''
> +        oldcwd = os.getcwd()
>          if os.path.isdir(src):
> +            dst = os.path.realpath(dst)
> +            # chdir() to src to avoid "Argument list too long" error
> +            os.chdir(src)
>              import glob
> -            if len(glob.glob('%s/.??*' % src)) > 0:
> -                source = '%s/.??* ' % src
> -            source = source + '%s/*' % src
> +            if len(glob.glob('./.??*')) > 0:
> +                source = './.??* '
> +            source += './*'
>          else:
>              source = src
>          cmd = 'cp -afl --preserve=xattr %s %s' % (source, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> +        os.chdir(oldcwd)


Question, why not just pass cwd=src in the check_output() call, rather than
changing it in the parent python process?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113cd736052213053ef3e029
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Oct 14, 2016 at 3:18 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 10/14/2016 05:58 PM, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On 10/13/2016 06:39 PM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
On 13 October 2016 at 10:45, Robert Yang &lt;<a href=3D"mailto:liezhi.yang@=
windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br>
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.<wbr>com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 This is because &quot;copyhardlinktree(deploy_arch_<wbr>dir, =
arch_channel)&quot; does:<br>
=C2=A0 =C2=A0 &quot;cp -afl deploy_arch_dir/* arch_channel&quot;, while the=
 deploy_arch_dir/* is<br>
=C2=A0 =C2=A0 expanded to &quot;deploy_arch_dir/pkg1 deploy_arch_dir/pkg2<b=
r>
=C2=A0 =C2=A0 deploy_arch_dir/pkg3 ...&quot; which causes the &quot;Argumen=
t list too long&quot;,<br>
=C2=A0 =C2=A0 change cwd to deploy_arch_dir can avoid the error.<br>
<br>
<br>
Would it be better to change the implementation of copyhardlinktree so that=
 it<br>
*can&#39;t* have this problem?<br>
</blockquote>
<br>
Good idea, thanks, updated in the repo:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/ope<wbr>nembe=
dded-core-contrib</a> rbt/long<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Drbt/long" rel=3D"noreferrer" target=3D"_blank">http://cgit.=
openembedded.org/c<wbr>git.cgi/openembedded-core-cont<wbr>rib/log/?h=3Drbt/=
long</a><br>
<br>
</blockquote>
<br></span>
Sorry, this patch is not what I wanted to paste, it should be:<br>
<br>
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py<br>
index 06a5af2..1d9cca5 100644<br>
--- a/meta/lib/oe/path.py<br>
+++ b/meta/lib/oe/path.py<br>
@@ -80,15 +80,20 @@ def copyhardlinktree(src, dst):<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;cd %s; find . -type d -prin=
t | tar --xattrs --xattrs-include=3D&#39;*&#39; -cf - -C %s -p --no-recursi=
on --files-from - | tar --xattrs --xattrs-include=3D&#39;*&#39; -xf - -C %s=
&quot; % (src, src, dst)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd, shell=3DTrue=
, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D &#39;&#39;<br></span><span cla=
ss=3D"">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldcwd =3D os.getcwd()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.isdir(src):<br></span>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.realpath(dst)<sp=
an class=3D""><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # chdir() to src to avoid &quot;=
Argument list too long&quot; error<br></span><span class=3D"">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(src)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import glob<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(glob.glob(&#39;%s/.??*&#3=
9; % src)) &gt; 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source =3D &#39;%s=
/.??* &#39; % src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source =3D source + &#39;%s/*&#3=
9; % src<br></span>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(glob.glob(&#39;./.??*&#39=
;)) &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source =3D &#39;./=
.??* &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source +=3D &#39;./*&#39;<span c=
lass=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D src<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &#39;cp -afl --preserve=3Dxattr %=
s %s&#39; % (source, dst)<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd, shell=3DTrue=
, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(oldcwd)</blockquote></div><br>Questio=
n, why not just pass cwd=3Dsrc in the check_output() call, rather than chan=
ging it in the parent python process?<br>-- <br><div class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at ker=
goth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113cd736052213053ef3e029--
