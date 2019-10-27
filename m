Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 567737FA8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:06:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l10so7266183wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=RLR8zb4XBhgjVXI28WcgiAfsPcYypdahfDM97oyERTc=;
	b=bZLyFCCh295RvetuqmLca1NSU+7D0VnToq6QqLxBaavkeovdCWnjk8sG+r28r0ampF
	iMBVEmHiclx674peMWO7nJD69IsX4gdlHyysHGx+2XinxlBMbOhy0TvnGNZ0mrn7koJv
	IJBqFaaboJ+a4ZASScQVuoCwtN6Dxger8vhcRKC8/pSDR9bXi+FUx+JsAVRf9Cjf/sDC
	bvcVL2og3lLYBuuBfh9ZqQxku3dTAarq5OoLv9KnGzXgZ/k5uceKwapPEWHk3zLuiigB
	wcq3hAwEueTSREhp0FMq41GRJhPxtlgDcJWKoUItXsqfxE78oG7j4TtBkX2mAM7cpYB1
	yhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=RLR8zb4XBhgjVXI28WcgiAfsPcYypdahfDM97oyERTc=;
	b=efVx7Kew2RtRsSqcUxOu06DnX1hhZGTe7p6ERK3957qAiiTc9FBLvcnKO6j4ktLNP0
	JeN1+Fjds9GmhKgGpxduj7tM7OQ1ozoSEWhSKv6WQTp74CW98mKzvepDUKTW/rtTretH
	zOv4sK5vB6s3ZO1BGJcrV6SaaZ4lsWFz+QJG4lD6DnpgOxpjR3AmJktkJUipx/qp18r2
	5G8SMX77A+/2rXLjHQGY9+96r/TPfuUVdSSzQp8mazOENjVkBqf3xfuAngZRdnF0S3iH
	K3cLY51prHxX/6yRS3EyXuRAUfqXzdvz4jG9ivvlxQ17rwJtZK/m+FFz53JhKAtJRQHV
	q/8g==
X-Gm-Message-State: APjAAAWFIzwYD6D7fFEkyujFZDEBbzJOCJOA1fw3lXzZ0WwC6sFVaMsF
	yrMh1w/5ZKbiMIG7aT2H7aKvEwRO84Y=
X-Google-Smtp-Source: APXvYqz13323RFylDkkwdXqToLcZPnOsb2lD+IXmdmq6S6KXzJV5oPDpzVgDp/4rW4fLOuZ+ZxSmXw==
X-Received: by 2002:adf:a547:: with SMTP id j7mr11174942wrb.154.1572188760769; 
	Sun, 27 Oct 2019 08:06:00 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id
	r13sm11214728wra.74.2019.10.27.08.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 08:06:00 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <ee102dfc-af38-5a75-0b64-0c6bb13bb106@gmail.com>
	<CANNYZj_PpuXczLf7SPcXdukZNjeCAWMXu1y9ENFUt-sYxdZv=g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <40172517-8f02-4657-68c3-115c6596d4b9@gmail.com>
Date: Sun, 27 Oct 2019 08:05:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_PpuXczLf7SPcXdukZNjeCAWMXu1y9ENFUt-sYxdZv=g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of stable warrior in Core/bitbake/YP layers
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
X-List-Received-Date: Sun, 27 Oct 2019 15:06:00 -0000
Content-Type: multipart/alternative;
	boundary="------------A379EBE5B1E2234A3DB708CF"
Content-Language: en-US

--------------A379EBE5B1E2234A3DB708CF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/27/19 4:03 AM, Alexander Kanavin wrote:
> On Sun, 27 Oct 2019 at 09:13, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Of the past month the warrior stable branch has been plagued with a=

>     build failure on FedoraCore30 regarding qemu virgl tests. This has
>     caused the slip of the next dot release to occur after Thud's.
>
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13543
>
>     The error message was this:
>
>     runqemu - ERROR - Failed to run qemu: libEGL warning: MESA-LOADER:
>     failed to open swrast (search paths /usr/lib64/dri)
>     libEGL warning: MESA-LOADER: failed to open swrast (search paths
>     /usr/lib64/dri)
>
>     qemu-system-i386: egl: eglInitialize failed
>     qemu-system-i386: OpenGL is not supported by the display
>
>     What has fixed this error is updating libdrm to 2.4.99 from
>     2.4.97. What
>     I can not tell is what commit(s) in those updates fixed the above
>     error
>
>     https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.h=
tml
>     https://lists.x.org/archives/xorg-announce/2019-April/002992.html
>
>     Has anyone seen the above error and might have an idea what commits=

>     would solve this issue?
>
>
> The DRI modules loaded from the host (swrast particularly) may try to
> resolve a symbol in libdrm-native that doesn't exist.

What I justed noticed on the host is that his has both 5.2 and 5.3
kernels. FC 30 was tested in the 2.7.1 so it worked at one point in
time. I wonder if the kernel got updated to 5.3 and now we need updated
headers for libdrm? That might support the missing symbols you mentioned
above.

Thanks for the hint.

- Armin
>
> I remember debugging a similar problem when TLS got accidentally
> switched off in mesa-native, what helped was tracing symbol
> resolution with the help of environment variables described in 'man
> ld.so' (can't remember off the top of my head what was the exact one).
>
> Alex


--------------A379EBE5B1E2234A3DB708CF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/27/19 4:03 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_PpuXczLf7SPcXdukZNjeCAWMXu1y9ENFUt-sYxdZv=g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Sun, 27 Oct 2019 at 09:13, akuster808 &lt;<a
            href="mailto:akuster808@gmail.com" target="_blank"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Of the past month the
            warrior stable branch has been plagued with a<br>
            build failure on FedoraCore30 regarding qemu virgl tests.
            This has<br>
            caused the slip of the next dot release to occur after
            Thud's.<br>
            <br>
            <a
              href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=13543"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://bugzilla.yoctoproject.org/show_bug.cgi?id=13543</a><br>
            <br>
            The error message was this:<br>
            <br>
            runqemu - ERROR - Failed to run qemu: libEGL warning:
            MESA-LOADER:<br>
            failed to open swrast (search paths /usr/lib64/dri)<br>
            libEGL warning: MESA-LOADER: failed to open swrast (search
            paths<br>
            /usr/lib64/dri)<br>
            <br>
            qemu-system-i386: egl: eglInitialize failed<br>
            qemu-system-i386: OpenGL is not supported by the display<br>
            <br>
            What has fixed this error is updating libdrm to 2.4.99 from
            2.4.97. What<br>
            I can not tell is what commit(s) in those updates fixed the
            above error<br>
            <br>
            <a
href="https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html</a><br>
            <a
              href="https://lists.x.org/archives/xorg-announce/2019-April/002992.html"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.x.org/archives/xorg-announce/2019-April/002992.html</a><br>
            <br>
            Has anyone seen the above error and might have an idea what
            commits<br>
            would solve this issue?<br>
          </blockquote>
          <div><br>
          </div>
          <div>The DRI modules loaded from the host (swrast
            particularly) may try to resolve a symbol in libdrm-native
            that doesn't exist.</div>
        </div>
      </div>
    </blockquote>
    <br>
    What I justed noticed on the host is that his has both 5.2 and 5.3
    kernels. FC 30 was tested in the 2.7.1 so it worked at one point in
    time. I wonder if the kernel got updated to 5.3 and now we need
    updated headers for libdrm? That might support the missing symbols
    you mentioned above.<br>
    <br>
    Thanks for the hint.<br>
    <br>
    - Armin<br>
    <blockquote type="cite"
cite="mid:CANNYZj_PpuXczLf7SPcXdukZNjeCAWMXu1y9ENFUt-sYxdZv=g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>I remember debugging a similar problem when TLS got
            accidentally switched off in mesa-native, what helped was
            tracing symbol</div>
          <div>resolution with the help of environment variables
            described in 'man ld.so' (can't remember off the top of my
            head what was the exact one).<br>
          </div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A379EBE5B1E2234A3DB708CF--
