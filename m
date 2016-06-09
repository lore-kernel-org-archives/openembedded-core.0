Return-Path: <d.falko.work@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id C327E60670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 07:01:36 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id g67so42915922vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 00:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=EVQQyzIV8R9FXWgtrAf9m6LkTXSxNwJEUo44JuHOgww=;
	b=oBtLypIv7mNa4r3IFj6OA/jyTatckuXNjG8e1kh4pLiyX2Ts+zc0LwpGqStAVGLnYr
	5G2fHox3GWzW2VR5eVrdwQbAfzr5DQHIgcrOV08oU20zHPx64a5sSPBz2KYL1Td7iVLa
	w6MNhpwpBZsa1v3aXkowudQzG/rbij9OEgKQka3NKKVO97bnjBvPnq+074C2YXANluVH
	1XVFbuUsTRD9vTflSJB4CgAOllPKxgCGQAs15bmjlsOxiOoP1VdpgCfHsqj/hY2kVPPF
	bgQEehqDXsH16KJqjyp36C/JbW25RR0l4q6IEG8kAL0M6OPeN6EazWWKIPWJ4+UOnww8
	qBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=EVQQyzIV8R9FXWgtrAf9m6LkTXSxNwJEUo44JuHOgww=;
	b=h0D04y6jOerWR67ymR9ZloLr6RnCiqKSpMgHr0PZPY4hEPenMMxQFHj8WgaKKImINJ
	WXLAQOcfZiuXQExWdE7+2YH/VrqajrOUWlvIB2FA7zoXUXxWAjl1MzLxqsDcrv9OqEpL
	bdVwGnvrryRqBhztKIJtkQF1QnMDi9oj1Zts+PODLqnrgrTP7EAHZfTQHtGXgaZJJUWz
	iZMB3rb6IPyfZYqx5l9Z6NLQb3/jz+C3eDWctsRaCZ/2ZraDzW/xIxCCQxav7yAlmHcg
	T2OqaCCVDUS3Zb8PMNFD082iKcvhgqGkJRRxYJyLL16WA1acTzjLhYnqiyDlkekpXGAI
	9xbA==
X-Gm-Message-State: ALyK8tKwEaCx4AqhtmU3DA53a9VUQmOUXyO8zOZDdN7Src/BU7w+brumxlaFkHTwdsayG7f4pz9JMGRLBGEj4g==
X-Received: by 10.159.37.100 with SMTP id 91mr3482979uaz.67.1465455697418;
	Thu, 09 Jun 2016 00:01:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.42.129 with HTTP; Thu, 9 Jun 2016 00:01:36 -0700 (PDT)
From: Dmitriy Falko <d.falko.work@gmail.com>
Date: Thu, 9 Jun 2016 10:01:36 +0300
Message-ID: <CAG+FGgdqAD=c7pKcjDck5M5sonXCZcVpuNXAmH1E4cmdV8ht1g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-connectivity][PATCH-Avahi-add-extra-path-to-GIR_EXTRA_LIBS_PATH]
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
X-List-Received-Date: Thu, 09 Jun 2016 07:01:38 -0000
X-Groupsio-MsgNum: 83230
Content-Type: multipart/mixed; boundary=94eb2c122da4483fb10534d2fec6

--94eb2c122da4483fb10534d2fec6
Content-Type: multipart/alternative; boundary=94eb2c122da4483fac0534d2fec4

--94eb2c122da4483fac0534d2fec4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi!

When building avahi on uclibc system, get error

| /media/falko/work/poky/build/tmp/work/cortexa15hf-neon-poky-linux-uclibce=
abi/avahi/0.6.32-s0/build/avahi-gobject/tmp-introspectErrwRJ/.libs/Avahi-0.=
6:
can't load library 'libavahi-gobject.so.0'
| If the above error message is about missing .so libraries, then
setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
| (typically like this: GIR_EXTRA_LIBS_PATH=3D"${B}/something/.libs" )
| Command '['/media/falko/work/poky/build/tmp/sysroots/odroid-xu4/usr/bin/g=
-ir-scanner-qemuwrapper',
'/media/falko/work/poky/build/tmp/work/cortexa15hf-neon-poky-linux-uclibcea=
bi/avahi/0.6.32-s0/build/avahi-gobject/tmp-introspectErrwRJ/.libs/Avahi-0.6=
',
'--introspect-dump=3D/media/falko/work/poky/build/tmp/work/cortexa15hf-neon=
-poky-linux-uclibceabi/avahi/0.6.32-s0/build/avahi-gobject/tmp-introspectEr=
rwRJ/functions.txt,/media/falko/work/poky/build/tmp/work/cortexa15hf-neon-p=
oky-linux-uclibceabi/avahi/0.6.32-s0/build/avahi-gobject/tmp-introspectErrw=
RJ/dump.xml']'
returned non-zero exit status 1


Fix it by adding extra path to GIR_EXTRA_LIBS_PATH, see attachment

--94eb2c122da4483fac0534d2fec4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi!</span><div style=3D"f=
ont-size:12.8px"><br></div><div style=3D"font-size:12.8px"><pre style=3D"wh=
ite-space:pre-wrap;width:50em;color:rgb(0,0,0)">When building avahi on ucli=
bc system, get error

| /media/falko/work/poky/build/tmp/work/cortexa15hf-neon-poky-linux-uclibce=
abi/avahi/0.6.32-s0/build/avahi-gobject/tmp-introspectErrwRJ/.libs/Avahi-0.=
6: can&#39;t load library &#39;libavahi-gobject.so.0&#39;
| If the above error message is about missing .so libraries, then setting u=
p GIR_EXTRA_LIBS_PATH in the recipe should help.
| (typically like this: GIR_EXTRA_LIBS_PATH=3D&quot;${B}/something/.libs&qu=
ot; )
| Command &#39;[&#39;/media/falko/work/poky/build/tmp/sysroots/odroid-xu4/u=
sr/bin/g-ir-scanner-qemuwrapper&#39;, &#39;/media/falko/work/poky/build/tmp=
/work/cortexa15hf-neon-poky-linux-uclibceabi/avahi/0.6.32-s0/build/avahi-go=
bject/tmp-introspectErrwRJ/.libs/Avahi-0.6&#39;, &#39;--introspect-dump=3D/=
media/falko/work/poky/build/tmp/work/cortexa15hf-neon-poky-linux-uclibceabi=
/avahi/0.6.32-s0/build/avahi-gobject/tmp-introspectErrwRJ/functions.txt,/me=
dia/falko/work/poky/build/tmp/work/cortexa15hf-neon-poky-linux-uclibceabi/a=
vahi/0.6.32-s0/build/avahi-gobject/tmp-introspectErrwRJ/dump.xml&#39;]&#39;=
 returned non-zero exit status 1


Fix it by adding extra path to GIR_EXTRA_LIBS_PATH, see attachment</pre></d=
iv></div>

--94eb2c122da4483fac0534d2fec4--

--94eb2c122da4483fb10534d2fec6
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Avahi-add-extra-path-to-GIR_EXTRA_LIBS_PATH.patch"
Content-Disposition: attachment; 
	filename="0001-Avahi-add-extra-path-to-GIR_EXTRA_LIBS_PATH.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ip7yhe5c0

RnJvbSAyZTg2ZTY2NGQ0MDg1ODk1ZmI1ZWI5YzlhNmYwMWY1MGUyZTk2ZWFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEbWl0cml5IEZhbGtvIDxkLmZhbGtvQHBhcnRuZXIuc2Ftc3Vu
Zy5jb20+CkRhdGU6IE1vbiwgNiBKdW4gMjAxNiAxNjo0MDo0OCArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIEF2YWhpLCBhZGQgZXh0cmEgcGF0aCB0byBHSVJfRVhUUkFfTElCU19QQVRICgotLS0KIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYXZhaGkvYXZhaGkuaW5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9hdmFoaS9hdmFoaS5pbmMgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2F2YWhpL2F2YWhpLmluYwppbmRleCA4MWFhZDc5Li4zNDBiM2U2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2F2YWhpL2F2YWhpLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2F2YWhpL2F2YWhpLmluYwpAQCAtNzEsNyArNzEsNyBAQCBkb19j
b25maWd1cmVfcHJlcGVuZCgpIHsKIH0KIAogZG9fY29tcGlsZV9wcmVwZW5kKCkgewotICAgIGV4
cG9ydCBHSVJfRVhUUkFfTElCU19QQVRIPSIke0J9L2F2YWhpLWNvbW1vbi8ubGliczoke0J9L2F2
YWhpLWNsaWVudC8ubGliczoke0J9L2F2YWhpLWdsaWIvLmxpYnMiCisgICAgZXhwb3J0IEdJUl9F
WFRSQV9MSUJTX1BBVEg9IiR7Qn0vYXZhaGktZ29iamVjdC8ubGliczoke0J9L2F2YWhpLWNvbW1v
bi8ubGliczoke0J9L2F2YWhpLWNsaWVudC8ubGliczoke0J9L2F2YWhpLWdsaWIvLmxpYnMiCiB9
CiAKIFBBQ0tBR0VTID0rICJhdmFoaS1kYWVtb24gbGliYXZhaGktY29tbW9uIGxpYmF2YWhpLWNv
cmUgbGliYXZhaGktY2xpZW50IGF2YWhpLWRuc2NvbmZkIGxpYmF2YWhpLWdsaWIgbGliYXZhaGkt
dWkgYXZhaGktYXV0b2lwZCBhdmFoaS11dGlscyIKLS0gCjIuNy40Cgo=

--94eb2c122da4483fb10534d2fec6--
