Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 07ECC6AE6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:19:50 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so3205827pab.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=uCtqi1ZsDzY0f9jbg/+JWtww9QSv44f4+c/fr9I4DSA=;
	b=ae1mUr9ZRXgRgzBQOKLBQE5VP1TJd4xnKZlDMHg+r66pe9QRKEXRMBBscyGW6E+V/J
	LtFGRQGWQ/fd0Yf592YVieKwbSj+9392ozpxUNXak+tHuMRKCckLN5D757zqyuwR7XT8
	y2gTZMxTnBUWMAaTPEDLqE4g+IhZS+q2HkS9kYpi5OfsZ7xLmFMdqo8KxnjnzDRgHwxy
	PWG5hpGf1p7K95rUafVQVBHgq1ZtjlpWTnsssHfngxsVjskRXIIkkdAsaB1CNtmslVGl
	wFWyfsCAqvcqtXOdSxiM15rKUw/GHRxxdlDVACaLZG2w2BgbA3Z9wo4yCqTDcoiVZhBq
	GgYA==
X-Gm-Message-State: ALoCoQleUQQx9q4zNU5c1wf/WRGXa3994MZ79PdlLK/eiyZgsNYpg99oHNXvuLbAaFBFaFsbSZyt
MIME-Version: 1.0
X-Received: by 10.66.192.132 with SMTP id hg4mr3784408pac.84.1376389190848;
	Tue, 13 Aug 2013 03:19:50 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 03:19:50 -0700 (PDT)
In-Reply-To: <520A070C.3090302@communistcode.co.uk>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
	<520A070C.3090302@communistcode.co.uk>
Date: Tue, 13 Aug 2013 11:19:50 +0100
X-Google-Sender-Auth: RU1YYoe5s0h9yZOETsWbzj3c8lU
Message-ID: <CAOMwXhOO=NpnDyPu-oryv7L72h1DCejycFe+8XBqVabc6fqfAQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: ml@communistcode.co.uk
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 10:19:50 -0000
Content-Type: multipart/alternative; boundary=047d7bdc93cacb17a604e3d194a1

--047d7bdc93cacb17a604e3d194a1
Content-Type: text/plain; charset=ISO-8859-1

I personally dislike top posting for a single entity in an email and I
think that is "nigh unbearable". ;-)

More to the point, if there is no documentation, why is the bugreport
closed rather than forming it into a documentation bugreport?

Also, I am still not sure we are on the same paper. You mean the python
script snippet will become optional? How will that mapping be done for
every possible options without adding explicit things to a feature set like
PACKAGECONFIG?


On Tue, Aug 13, 2013 at 11:14 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 13/08/13 10:52, Laszlo Papp wrote:
> > As we have already discussed that, it is not any clear at all without
> > example. Yes, the end user does not really care about the internal
> > implementation of the feature ....
> >
> > Please provide useful examples and tutorials how to use a feature
> > especially when a user (and apparently others posting here) is such
> > clueless.
> >
> > Oh, by the way, and I have mentioned this in the bug report as well. We
> > need proper documentation, examples, and tutorials; i.e. I am not ahead
> > of the day when I first read this post. ;-)
> >
> >
> > On Tue, Aug 13, 2013 at 10:48 AM, Burton, Ross <ross.burton@intel.com
> > <mailto:ross.burton@intel.com>> wrote:
> >
> >     On 13 August 2013 08:32, Laszlo Papp <lpapp@kde.org
> >     <mailto:lpapp@kde.org>> wrote:
> >     > So, everyone suggested PACKAGECONFIG in here on the mailing list
> >     except Khem
> >     > whose reply I did not get.
> >     >
> >     > Yet, 4964 got closed by the "team". Could anyone please give a sane
> >     > description why and what would block the end users other than fork?
> >
> >     Quoting from comment 1 on 4964:
> >
> >     """
> >     Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately
> >     not sufficient to manage it's config system. It is very similar to
> the
> >     Linux kernel config and we recently added configuration fragment
> >     support to busybox from the kernel recipes:
> >
> >     commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54
> >     Author: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com
> >>
> >     Date:   Tue Feb 5 14:36:40 2013 +0800
> >
> >         busybox: add config fragments
> >
> >     This allows you to use the default config and include only the delta
> >     in your layer's bbappend in the form of a config fragment added to
> the
> >     SRC_URI.
> >     """
> >
> >     If this isn't sufficient or is buggy, then fixing this is preferred
> >     (it works for the kernel, so should work for busybox).
> >
> >     Ross
> >
> >
> >
> >
>
> 1) The top posting in this thread is nigh unbearable, please bottom post
> in order to keep the flow of conversation.
>
> 2) The busybox config fragments was added in this cycle, which is
> probably the reason for no official documentation yet.
>
> 3) There is an example in the bug report where it was added
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3379) which you can
> look at if you wish to be an early adopter and test this _new_ feature.
>
> 4) For simplicity I have copied the explanation in below:
>
> > Steps:
> > 1. Add a new cal.cfg file to meta/recipes-core/busybox/busybox-1.20.2/
> > $ cat cal.cfg
> > CONFIG_CAL=y
> >
> > 2. Run "bitbake busybox"
> > Check the
> build/tmp/work/armv5te-poky-linux-gnueabi/busybox/1.20.2-r5/busybox-1.20.2/.config
> file.
> > The CONFIG_CAL should be set to y.
> >
> > 3. Run "bitbake core-image-minimal"
> > Boot up the image, the cal command should be exist.
> > root@qemuarm:~# which cal
> > /usr/bin/cal
> > root@qemuarm:~# ls -l /usr/bin/cal
> > lrwxrwxrwx    1 root     root            12 Mar  1 06:17 /usr/bin/cal ->
> /bin/busybox
> > root@qemuarm:~#
>
> So, all you need to do is add CONFIG_RFKILL=n or whatever the config
> name is and that should remove rfkill from the busybox command set.
>
> Regards,
>
> --
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambrideshire, UK
>   http://www.embed.me.uk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bdc93cacb17a604e3d194a1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I personally dislike top posting for a single entity in an=
 email and I think that is &quot;nigh unbearable&quot;. ;-)<div><br></div><=
div>More to the point, if there is no documentation, why is the bugreport c=
losed rather than forming it into a documentation bugreport?<div>
<br></div><div>Also, I am still not sure we are on the same paper. You mean=
 the python script snippet will become optional? How will that mapping be d=
one for every possible options without adding explicit things to a feature =
set like PACKAGECONFIG?</div>
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Tue, Aug 13, 2013 at 11:14 AM, Jack Mitchell <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ml@communistcode.co.uk" target=3D"_blank">ml@communistcode.co.u=
k</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 13/08/13 10:52, Laszlo =
Papp wrote:<br>
&gt; As we have already discussed that, it is not any clear at all without<=
br>
&gt; example. Yes, the end user does not really care about the internal<br>
&gt; implementation of the feature ....<br>
&gt;<br>
&gt; Please provide useful examples and tutorials how to use a feature<br>
&gt; especially when a user (and apparently others posting here) is such<br=
>
&gt; clueless.<br>
&gt;<br>
&gt; Oh, by the way, and I have mentioned this in the bug report as well. W=
e<br>
&gt; need proper documentation, examples, and tutorials; i.e. I am not ahea=
d<br>
&gt; of the day when I first read this post. ;-)<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Aug 13, 2013 at 10:48 AM, Burton, Ross &lt;<a href=3D"mailto:r=
oss.burton@intel.com">ross.burton@intel.com</a><br>
</div><div class=3D"im">&gt; &lt;mailto:<a href=3D"mailto:ross.burton@intel=
.com">ross.burton@intel.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 On 13 August 2013 08:32, Laszlo Papp &lt;<a href=3D"mailto:lpa=
pp@kde.org">lpapp@kde.org</a><br>
</div><div class=3D"im">&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:lpapp@kde=
.org">lpapp@kde.org</a>&gt;&gt; wrote:<br>
&gt; =A0 =A0 &gt; So, everyone suggested PACKAGECONFIG in here on the maili=
ng list<br>
&gt; =A0 =A0 except Khem<br>
&gt; =A0 =A0 &gt; whose reply I did not get.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Yet, 4964 got closed by the &quot;team&quot;. Could anyon=
e please give a sane<br>
&gt; =A0 =A0 &gt; description why and what would block the end users other =
than fork?<br>
&gt;<br>
&gt; =A0 =A0 Quoting from comment 1 on 4964:<br>
&gt;<br>
&gt; =A0 =A0 &quot;&quot;&quot;<br>
&gt; =A0 =A0 Busybox is a rather complicated beast. PACKAGECONFIG is unfort=
unately<br>
&gt; =A0 =A0 not sufficient to manage it&#39;s config system. It is very si=
milar to the<br>
&gt; =A0 =A0 Linux kernel config and we recently added configuration fragme=
nt<br>
&gt; =A0 =A0 support to busybox from the kernel recipes:<br>
&gt;<br>
&gt; =A0 =A0 commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54<br>
</div>&gt; =A0 =A0 Author: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.=
com">Qi.Chen@windriver.com</a> &lt;mailto:<a href=3D"mailto:Qi.Chen@windriv=
er.com">Qi.Chen@windriver.com</a>&gt;&gt;<br>
<div class=3D"im">&gt; =A0 =A0 Date: =A0 Tue Feb 5 14:36:40 2013 +0800<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 busybox: add config fragments<br>
&gt;<br>
&gt; =A0 =A0 This allows you to use the default config and include only the=
 delta<br>
&gt; =A0 =A0 in your layer&#39;s bbappend in the form of a config fragment =
added to the<br>
&gt; =A0 =A0 SRC_URI.<br>
&gt; =A0 =A0 &quot;&quot;&quot;<br>
&gt;<br>
&gt; =A0 =A0 If this isn&#39;t sufficient or is buggy, then fixing this is =
preferred<br>
&gt; =A0 =A0 (it works for the kernel, so should work for busybox).<br>
&gt;<br>
&gt; =A0 =A0 Ross<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
</div>1) The top posting in this thread is nigh unbearable, please bottom p=
ost<br>
in order to keep the flow of conversation.<br>
<br>
2) The busybox config fragments was added in this cycle, which is<br>
probably the reason for no official documentation yet.<br>
<br>
3) There is an example in the bug report where it was added<br>
(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3379" targe=
t=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3379</a>) =
which you can<br>
look at if you wish to be an early adopter and test this _new_ feature.<br>
<br>
4) For simplicity I have copied the explanation in below:<br>
<br>
&gt; Steps:<br>
&gt; 1. Add a new cal.cfg file to meta/recipes-core/busybox/busybox-1.20.2/=
<br>
&gt; $ cat cal.cfg<br>
&gt; CONFIG_CAL=3Dy<br>
&gt;<br>
&gt; 2. Run &quot;bitbake busybox&quot;<br>
&gt; Check the build/tmp/work/armv5te-poky-linux-gnueabi/busybox/1.20.2-r5/=
busybox-1.20.2/.config file.<br>
&gt; The CONFIG_CAL should be set to y.<br>
&gt;<br>
&gt; 3. Run &quot;bitbake core-image-minimal&quot;<br>
&gt; Boot up the image, the cal command should be exist.<br>
&gt; root@qemuarm:~# which cal<br>
&gt; /usr/bin/cal<br>
&gt; root@qemuarm:~# ls -l /usr/bin/cal<br>
&gt; lrwxrwxrwx =A0 =A01 root =A0 =A0 root =A0 =A0 =A0 =A0 =A0 =A012 Mar =
=A01 06:17 /usr/bin/cal -&gt; /bin/busybox<br>
&gt; root@qemuarm:~#<br>
<br>
So, all you need to do is add CONFIG_RFKILL=3Dn or whatever the config<br>
name is and that should remove rfkill from the busybox command set.<br>
<br>
Regards,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
=A0 Jack Mitchell (<a href=3D"mailto:jack@embed.me.uk">jack@embed.me.uk</a>=
)<br>
=A0 Embedded Systems Engineer<br>
=A0 Cambrideshire, UK<br>
=A0 <a href=3D"http://www.embed.me.uk" target=3D"_blank">http://www.embed.m=
e.uk</a><br>
--<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--047d7bdc93cacb17a604e3d194a1--
