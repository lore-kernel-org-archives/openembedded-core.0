Return-Path: <freakforever@gmail.com>
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
	[209.85.222.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1E35C602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 15:52:41 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id j8so915240uae.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S1PDDf6F98FskH6n2Jno4p6jyuN4ztYkIQdUynYYHiU=;
	b=e5S0paUzlhpSA2i8CCTnsvZzGTpZg452wYv1ZaUcOLMLzM2WyFcpCCRyUH6rIHGrck
	hPuF/DxEN7pvxWN8qSllrxIe4q6ipWFTmOTj8Ammx8r+d+mz+xsdmLgmvvSbtSkv1CnI
	h8tiAZ7KFaxlIbHG4PmJWKzGHzq0xEOYYFB69Miqc0H0WUfNTfqS8tc+YWE+cJ0srPrn
	k6zLSvRU6BWUgsDlwvAnq9Qm0/vZzlOjD5p20lFL0RlZWQhH8mhRsamm+Su30rlQwz8o
	9qMlLxTJVUG1UMrdwXTwTY+mxfpo2Ldp3vM3tLcq1GBtqY37/Oc8gX08pr2jKVEJVpt+
	h/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S1PDDf6F98FskH6n2Jno4p6jyuN4ztYkIQdUynYYHiU=;
	b=szygLky7LffO5QBgvKXmBw+6Qj6WN1eXzgN51ZwdNytnh78PhIX42xNpciQq81gBmo
	Bc1E2HjUcY9qRSKN2uRjcrkoteo71HoY6ckpfMTGJU5B0TtrFXcXaE/Rw+flk5zSAHPS
	bu2Um1oUuAmHJfKSxlyiOjLS1IXeQV/WuPAnQwaga5Sd/kkpb397HeF68/WJ4uLWIMAI
	hrGIFhoEC7bmxhXjEG7c0sVI76c52JCIyMpvy6dwWPPNmYOuuQ157QuSmlhJzbu+BayR
	5k6UibGZjr0Daz0BB9haWp9rexo+yPFadagylTxQwd4hHu/Fa12eVgmKUAkxSzeZtglv
	mIWg==
X-Gm-Message-State: AHQUAubhw8uU4eyC4gOSIUoQOWjeOire7BKZZgaw87FJByqKVARClld1
	ENjaQPsgh/o+BzLxnBvvhdcY+8UbEOXyj5YOPzc=
X-Google-Smtp-Source: AHgI3IYN4iRuy6smBhWLM/ypkg4cKwbYETdER23Ub8TDEMdbS85tHI+cJcOtxyNe6yFvcDnJzgZireIEuuE2R8ROBCU=
X-Received: by 2002:ab0:72d5:: with SMTP id g21mr451512uap.16.1550073162799;
	Wed, 13 Feb 2019 07:52:42 -0800 (PST)
MIME-Version: 1.0
References: <CAHN4dxphUCH+QvMFStdoPe_6BJYUKpzfQy-iR8vEZMUJ+k41LA@mail.gmail.com>
	<CANNYZj9VonBDOVD0fyH7JcwdwUQxhAuyM1AcwRGEyLeeg74xBw@mail.gmail.com>
In-Reply-To: <CANNYZj9VonBDOVD0fyH7JcwdwUQxhAuyM1AcwRGEyLeeg74xBw@mail.gmail.com>
From: John Ras <freakforever@gmail.com>
Date: Wed, 13 Feb 2019 15:52:31 +0000
Message-ID: <CAHN4dxrTomzeUmODej+Vdcv0D3mkxTO6NWw=619QVkNF4cgAtQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gl support for qemuaarch64
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
X-List-Received-Date: Wed, 13 Feb 2019 15:52:42 -0000
Content-Type: multipart/alternative; boundary="0000000000003ea0e90581c888e5"

--0000000000003ea0e90581c888e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Alex,

Yes i know, I'm targeting for arm though. I see '3d acceleration enabled'
so it was pointing me to its availability still without KVM. I was finally
able to have weston and its gl examples working for aarch64 and performance
seems reasonable. I'm still evaluating it though.


Br,
Joao



On Wed, Feb 13, 2019 at 10:52 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 12 Feb 2019 at 18:54, Jo=C3=A3o Rasta <freakforever@gmail.com> wr=
ote:
> > I was trying to build virgl-gtk branch for ARM qemu target, but I'm not
> completely sure if it's possible as it generally seems to require KVM.
> >
> > qemu-system-aarch64 has the virtio-gpu-pci device, which i'd assume to
> support GL forwarding to the host if compiled with libvirglrenderer. I've
> also been able to run a cross-compiled image reporting [drm] 3d
> Acceleration enabled. However, I was not able to start any graphics
> application on the guest.
> >
> > Could someone pls clarify this?
>
> First, do you need specifically qemuarm64? qemux86_64 is significantly
> faster because it has kvm. I never tried arm or other emulation
> targets because of that, it's all tested with x86*.
>
> The tests you need to do are:
> a) run 'dmesg | grep drm'. What do you see?
>
> b) add kmscube to your image and run that. There is a demo video I
> made so you can see how it works:
> https://www.youtube.com/watch?v=3D0YBuku3JESc&feature=3Dyoutu.be
>
> Alex
>

--0000000000003ea0e90581c888e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Alex,<div><br></div><div>Yes i know, I&#39;m target=
ing for arm though. I see &#39;3d acceleration enabled&#39; so it was point=
ing me to its availability still without KVM. I was finally able to have we=
ston and its gl examples working for aarch64 and performance seems reasonab=
le. I&#39;m still evaluating it though.</div><div><br></div><div><br></div>=
<div>Br,</div><div>Joao</div><div><br></div><div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 13, =
2019 at 10:52 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 12 Feb 2019 at 18:54,=
 Jo=C3=A3o Rasta &lt;<a href=3D"mailto:freakforever@gmail.com" target=3D"_b=
lank">freakforever@gmail.com</a>&gt; wrote:<br>
&gt; I was trying to build virgl-gtk branch for ARM qemu target, but I&#39;=
m not completely sure if it&#39;s possible as it generally seems to require=
 KVM.<br>
&gt;<br>
&gt; qemu-system-aarch64 has the virtio-gpu-pci device, which i&#39;d assum=
e to support GL forwarding to the host if compiled with libvirglrenderer. I=
&#39;ve also been able to run a cross-compiled image reporting [drm] 3d Acc=
eleration enabled. However, I was not able to start any graphics applicatio=
n on the guest.<br>
&gt;<br>
&gt; Could someone pls clarify this?<br>
<br>
First, do you need specifically qemuarm64? qemux86_64 is significantly<br>
faster because it has kvm. I never tried arm or other emulation<br>
targets because of that, it&#39;s all tested with x86*.<br>
<br>
The tests you need to do are:<br>
a) run &#39;dmesg | grep drm&#39;. What do you see?<br>
<br>
b) add kmscube to your image and run that. There is a demo video I<br>
made so you can see how it works:<br>
<a href=3D"https://www.youtube.com/watch?v=3D0YBuku3JESc&amp;feature=3Dyout=
u.be" rel=3D"noreferrer" target=3D"_blank">https://www.youtube.com/watch?v=
=3D0YBuku3JESc&amp;feature=3Dyoutu.be</a><br>
<br>
Alex<br>
</blockquote></div>

--0000000000003ea0e90581c888e5--
