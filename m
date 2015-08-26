Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 646FD734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 11:03:38 +0000 (UTC)
Received: by qkfh127 with SMTP id h127so117146396qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 04:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YTd8EnvWA+MAZ7B5vKRFldJAFHz42lWz3Wx+qCyyd0M=;
	b=RV+4TbPwtgslCBzHeTR518qXKrfmQXQIhI2ib9Ws4hj07VxrLhACZAo30YPpItZdj6
	0CFPwBxRQql1PrdOjKq2lzAtH8+vkHdV44sDcvv0g2DMklhXUl6N7Ee/FPS6Q7a00+tQ
	jWswoiu51rqN/BfEYTvua/U72iImL8X4YR8hucseTa23ZXLj6d+/uJ0XhtP0qau0cmrV
	lk/JIyzWo7XLd2Wwf2OLcCP2u1LDmOruhr5FcRuYmVpAsRCP3xI5EPWbWYfqSPbLm+AM
	cwBSYAp24GCdst2P5k9Hboyb7zMriwuIpVz+8gmHgUL2merCmfJz0c587+dQJNw9URy+
	ekyQ==
X-Gm-Message-State: ALoCoQkSnmMiqv1T/YK+KBQf0jz5jDXD5pp3ZFIqQLE++5DXWWlBkXRV7c564oltHrNJQvhfKX3z
X-Received: by 10.55.197.151 with SMTP id k23mr76437988qkl.13.1440587018524;
	Wed, 26 Aug 2015 04:03:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 26 Aug 2015 04:03:19 -0700 (PDT)
In-Reply-To: <1435222553-1609-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435222553-1609-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Aug 2015 12:03:19 +0100
Message-ID: <CAJTo0La9LtL-o57Z-VTBBVN=rbKR0MFb2UDye-8Z8wmRXb5ZhA@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: add user uuidd and group uuidd
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
X-List-Received-Date: Wed, 26 Aug 2015 11:03:39 -0000
Content-Type: multipart/alternative; boundary=001a11499670820e84051e34cdb8

--001a11499670820e84051e34cdb8
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 09:55, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> +pkg_postinst_${PN}-uuidd () {
> +    if [ "x$D" != "x" ]; then
> +        OPTS="--root=$D"
> +        if type systemctl >/dev/null 2>/dev/null; then
> +            systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> +        fi
> +        exit 1
> +    fi
> +
> +    chown uuidd.uuidd ${sbindir}/uuidd
> +    chmod g+s ${libdir}/libuuid
> +}
>

The systemd class handles the systemctl invocation for you, or would if you
set SYSTEMD_PACKAGES correctly.

Ross

--001a11499670820e84051e34cdb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 09:55, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
xin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hi=
dden">+pkg_postinst_${PN}-uuidd () {<br>
+=C2=A0 =C2=A0 if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPTS=3D&quot;--root=3D$D&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if type systemctl &gt;/dev/null 2&gt;/dev/null=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl $OPTS ${SYSTEMD_AUTO_E=
NABLE} ${SYSTEMD_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 chown uuidd.uuidd ${sbindir}/uuidd<br>
+=C2=A0 =C2=A0 chmod g+s ${libdir}/libuuid<br>
+}</div></blockquote><div><br></div><div>The systemd class handles the syst=
emctl invocation for you, or would if you set SYSTEMD_PACKAGES correctly.</=
div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11499670820e84051e34cdb8--
