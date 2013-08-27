Return-Path: <andrei@gherzan.ro>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 96BFA6B275
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:20:11 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id m15so3666028wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cvzaEeIl8ZAiyKoGCftaiT2zA3v5DhrxtRgHCIaYBg8=;
	b=mTSqnWc5etRTZFiXB3cOiMbtRovZJ5IodGihZMAuVM6C083Hhvn12k3uzWh5iUnu/C
	XoVacnYjeeDRPlaoVnR4OppcIUml5+yUniEIzYCc7vzT3UjPD4LTg3j0A6qXWEg1xFl+
	triPSPenq7m0jhkVzrQ+OlZ5E+P2GAP2K3U92KF+YE57ZlF6gMpxrEWoxVgjyNtu7PK7
	KLGAv62drRNufmpXPxo6uPiQqp66Efzr0DcWBhcWYR+zS1LDMdpArZi7ipFcqZhd0atV
	yfGSG8mFyYCpKlbF0MpUl1JnknWkgNbRg8pBn8Nl5WLU9LUnwtuhI9YhImXeNE88vE44
	BBnw==
X-Gm-Message-State: ALoCoQlVayTVKhbkwd1Rp66GJ9mVzWOjPn06F3Z5hn51sj42De1t3jAVb6iopzCUjC9YR6lzpvCI
X-Received: by 10.180.104.33 with SMTP id gb1mr10297171wib.25.1377588011613;
	Tue, 27 Aug 2013 00:20:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.91.198 with HTTP; Tue, 27 Aug 2013 00:19:51 -0700 (PDT)
X-Originating-IP: [5.13.196.58]
In-Reply-To: <521BCCD8.6080804@linux.intel.com>
References: <1377542924-1605-1-git-send-email-andrei.gherzan@windriver.com>
	<521BCCD8.6080804@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 27 Aug 2013 10:19:51 +0300
Message-ID: <CAK18fxGDNu1+fvEZGoKGokTJ8A5Q4bYS4nZQvmrrvQbiCK_rLA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc: nscd support depends on OPTION_EGLIBC_INET
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
X-List-Received-Date: Tue, 27 Aug 2013 07:20:12 -0000
Content-Type: multipart/alternative; boundary=f46d0442678e1453c304e4e8b421

--f46d0442678e1453c304e4e8b421
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 27, 2013 at 12:47 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/26/2013 11:48 AM, Andrei Gherzan wrote:
>
>> Add --disable-nscd if DISTRO_FEATURES does not contain ipv4. This
>> features is
>> mapped to OPTION_EGLIBC_INET.
>> The default behavior is to activate nscd (if --disable-nscd is not passed
>> to
>> configure script). But nscd depends on OPTION_EGLIBC_INET, so compilation
>> will
>> fail if this option is not activated.
>>
>>  Does this also need the Package to be set for ALLOW_EMPTY?
>
> Sau!
>
>
You're right. V2 is coming. Thanks.


-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--f46d0442678e1453c304e4e8b421
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Aug 27, 2013 at 12:47 AM, Saul Wold <span dir=3D"ltr">&lt;<=
a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 08/26/2013 11:48 AM, An=
drei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Add --disable-nscd if DISTRO_FEATURES does not contain ipv4. This features =
is<br>
mapped to OPTION_EGLIBC_INET.<br>
The default behavior is to activate nscd (if --disable-nscd is not passed t=
o<br>
configure script). But nscd depends on OPTION_EGLIBC_INET, so compilation w=
ill<br>
fail if this option is not activated.<br>
<br>
</blockquote></div>
Does this also need the Package to be set for ALLOW_EMPTY?<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><d=
iv><br></div><div style>You&#39;re right. V2 is coming. Thanks.=A0</div></d=
iv><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><div style=3D"t=
ext-align:center">

</div><div style=3D"text-align:center"><div align=3D"left" style=3D"font-fa=
mily:&#39;Times New Roman&#39;;font-size:medium"><b style=3D"color:rgb(51,5=
1,51);font-family:Arial;font-size:small;text-align:center">Andrei Gherzan</=
b><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--f46d0442678e1453c304e4e8b421--
