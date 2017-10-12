Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 348FA6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:25:54 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id l194so1414896qke.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 07:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YfLDOhVYuRiw6KTX6DkOwJcNNZo5Sv2S7AoxtnNgQfs=;
	b=DZ7XCJVmhAz0WtOOet0b7O8ToI8Ut9Xe3ynKpr5RM9HZvs4UF01vSRz4AwkRbqxcgz
	z9L1f5B5j+rIx1NI9V3wcS3xuGLXNsTSxSuBG6AeKnm5uW4FGUcMKkvj6ZrjjxAjr+pX
	kkbNKlfh1hZMgDrAWKJO+m+GrKEUWB5YDtTWOfZ2LUTSIlB/ETF21U8/4VLCHSs1I6lB
	Iaa2cZgpXYXmc4o1WfoWmqz+uXlGht+BwKiXZZ5SIcMgzOg+7iV2NwxYc5YtxbPSzIh+
	f8Ro6d/3im2/sKmE+ePAodKlrAXMAGXmHCezIzDuqjjTWho0oQ9FZQ8YK/xYEAe7nGKX
	zT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YfLDOhVYuRiw6KTX6DkOwJcNNZo5Sv2S7AoxtnNgQfs=;
	b=MEtI2MFagV5DTU6CNRE3XLIWt/2wcXG0hskFO75MjQc2MI0y7U4xLAWL4wFQsSToUp
	GkwWV9JE9uv/c/8hAnknhX7Od4OJJHAznfEOQXsxMftII73LsfdC5M4zZhTMgbVOmXRG
	xe9b1zMnF5wZ1tVg5zjBssgw+ecg16GMWOWzLrbHYzu8sllYwCv1cAPppntMi2FFCM/b
	p+ntQn/2oOeIyH3g+fYAiMI/cEHG1i9PhebQDuIZx18+5kpNWoGOV19hESASjJvh2U8t
	bQOh46LK7qbUJAf2l6CAn3g17I1WpK9uFOAgb3FyWArtddRtB+E9thd/W0oyJ9IYlRwK
	pPtw==
X-Gm-Message-State: AMCzsaVF8ouDTbTeh3lax+krfOGl+dNeF4yfhHR7jCIJhrTx6gxxd4er
	FfU6tPIUmBaw4ZQuazwTHfsAKpCthtGfTUKhk4A=
X-Google-Smtp-Source: AOwi7QAmK8L2OlkTytRLzGDVOc5/k4/DrHjijL6Io+Jkm12PyBQZ4QVS9NUNpVl5bwi9YG/BFyKXeUvJqAOUO+IbSdM=
X-Received: by 10.55.96.134 with SMTP id u128mr739720qkb.290.1507818354683;
	Thu, 12 Oct 2017 07:25:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.196 with HTTP; Thu, 12 Oct 2017 07:25:54 -0700 (PDT)
In-Reply-To: <CALatG=4EguhkFgC-cSJ4tgrLDUtog1FMJN8NAr6WQG2qKmogLw@mail.gmail.com>
References: <1506920927-1938-1-git-send-email-liu.ming50@gmail.com>
	<e2c0777f-af1f-d7d9-ebe3-816f4d6059a2@linux.intel.com>
	<CALatG=4EguhkFgC-cSJ4tgrLDUtog1FMJN8NAr6WQG2qKmogLw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 12 Oct 2017 16:25:54 +0200
Message-ID: <CALatG=7JP1nj6PSwth+5ZvAigVp4iY1o64b3NoWoT80vNgrz2Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Thu, 12 Oct 2017 14:25:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c05436a6ab336055b5a5106"

--94eb2c05436a6ab336055b5a5106
Content-Type: text/plain; charset="UTF-8"

Ping, this patch had been merged to libsolv upstream.

//Ming Liu

2017-10-03 5:59 GMT+02:00 Ming Liu <liu.ming50@gmail.com>:

> Hi, Alexander:
>
> Thanks for the input, I will then try to investigate the rpm code for
> tweaking the values.
>
> //Ming Liu
>
> 2017-10-02 13:37 GMT+02:00 Alexander Kanavin <alexander.kanavin@linux.
> intel.com>:
>
>> On 10/02/2017 08:08 AM, liu.ming50@gmail.com wrote:
>>
>>> From: Ming Liu <liu.ming50@gmail.com>
>>>
>>> This patch aims to fix a kernel-devsrc rpm installation failure on
>>> target, I had sent the patch to libsolv upstream, but its maintainers
>>> rejected it with the reason:
>>> ...
>>> we probably want to sync these values with RPM code...
>>> ...
>>>
>>> I am not a rpm expert, would somebody please comment on this? Is this a
>>> issue also should be addressed in rpm?
>>>
>>
>> Note that they did not reject the pull request, but merely commented on
>> it; it is still open.
>>
>> What the upstream probably meant is that rpm could also be defining these
>> values somewhere, and so instead of just re-defining them blindly to
>> arbitrary values in libsolv, you should take them from rpm header files, or
>> otherwise figure out how the header limits are handled in rpm.
>>
>> Alex
>>
>
>

--94eb2c05436a6ab336055b5a5106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping, this patch had been merged to libsolv upstream.<div>=
<br></div><div>//Ming Liu</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">2017-10-03 5:59 GMT+02:00 Ming Liu <span dir=3D"ltr">&l=
t;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmai=
l.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi=
, Alexander:<div><br></div><div>Thanks for the input, I will then try to in=
vestigate the rpm code for tweaking the values.</div><span class=3D"HOEnZb"=
><font color=3D"#888888"><div><br></div><div>//Ming Liu</div></font></span>=
</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">2017-10-02 13:37 GMT+02:00 Alexander Kanavin <=
span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" t=
arget=3D"_blank">alexander.kanavin@linux.<wbr>intel.com</a>&gt;</span>:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span>On 10/02/2017 08:08 AM, <a href=3D"mai=
lto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a> wrote:=
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank=
">liu.ming50@gmail.com</a>&gt;<br>
<br>
This patch aims to fix a kernel-devsrc rpm installation failure on<br>
target, I had sent the patch to libsolv upstream, but its maintainers<br>
rejected it with the reason:<br>
...<br>
we probably want to sync these values with RPM code...<br>
...<br>
<br>
I am not a rpm expert, would somebody please comment on this? Is this a<br>
issue also should be addressed in rpm?<br>
</blockquote>
<br></span>
Note that they did not reject the pull request, but merely commented on it;=
 it is still open.<br>
<br>
What the upstream probably meant is that rpm could also be defining these v=
alues somewhere, and so instead of just re-defining them blindly to arbitra=
ry values in libsolv, you should take them from rpm header files, or otherw=
ise figure out how the header limits are handled in rpm.<br>
<br>
Alex<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c05436a6ab336055b5a5106--
