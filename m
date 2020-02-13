Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 507B560EC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:24:52 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id b2so1733870vkk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QjgDizG95hS50QGe8jELBPwSUjs1ZmL5BqUaDD6Tbck=;
	b=cLXg5VkyhxWvay5eq2ietQLf2Gi7keXyFZflYXLQF59Ps4g+07QwUh96t9qn2rXVeY
	qj+l4QWg9u6xVwk81iyv4lNgYj0BtkqTRaSzikOLrfySsjT+O0WC6BtBA5XBTgjhBZ6F
	9JEQ2i5rgFeDRXQV8rbn0hFnTzrnW+sLLry+Dx/eHT2fNtOOIezkpSHQT4GQ1U9tCrUn
	JgD9JZm5cdiq8HAjDFqirzGKs3ZlyUundbU0NfguCxSTHcYQvRkwVazIxxdRo7afFLme
	P+9TzMR0sZLh14ZXFtjoGm8mH8KdFulCYOBLNY+8SvUOrBd8q+LJK9FbfrcJbywh3uOp
	85fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QjgDizG95hS50QGe8jELBPwSUjs1ZmL5BqUaDD6Tbck=;
	b=Kunlq1DnaG8bSkYUw8UZ8J3md5r1tglij/+lOzWtRAeGUsFQt0bAuuhgGsV7jWcEm0
	cm1+do+ZL0+pKIDrArr3Ia85mI+PjTeiG3YI1FfKy1HBJabwJT2P4oc+nX3NGn859woM
	871OSJhuVvPs5ExIozP/SI3ZuUVYop/qZFZOB8Bm5DambekgKfEE/2utbNGRcYNTNp6D
	u+adbUJ5NtKcgwSb3w9oOkDdYd5UsyUfEZqPd6RvOC3njVjz4A886JsHWVJVIIhQNPs5
	/cqeyLJxkhlanO3DfuX2bRCIGqlbWXqp0wLJ+R2LkTOlCNH0pOZVxafK6Sx9Um5xZ2h6
	V8jA==
X-Gm-Message-State: APjAAAVRa5DF5FJ1tL6QLtd99gFjy617EBztc9DZkmnneKVcmMHo/TF4
	3yiDv0UCCKZg5mkFycXR16+EOqakWHa7jcBgQdA=
X-Google-Smtp-Source: APXvYqyqwfC315FSRKjZjD915Sj7if0qqHCR/88cNlMvrf2UR7VR5jAJofWBRnw22LSYuGfGPBj2VDmZVcI78y52HoA=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr11133236vkc.29.1581611093160;
	Thu, 13 Feb 2020 08:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
	<CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
	<CAMKF1sqiOxhyd98HTVbqCLWhxBeqW1sZ_d5cvT8E+OMUQejMHQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqiOxhyd98HTVbqCLWhxBeqW1sZ_d5cvT8E+OMUQejMHQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 17:25:22 +0100
Message-ID: <CANNYZj8FsGqPQ9dOVSiOpg0DEGK-+rXLa3Xr86+ZjDcyyDDoPg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 16:24:52 -0000
Content-Type: multipart/alternative; boundary="0000000000006175ed059e778781"

--0000000000006175ed059e778781
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Feb 2020 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:

> No, problem is that if One wants to use opkg backend then rpm drags along
> but apt or dpkg don=E2=80=99t
>
> Even if test is made to pass rpm will be dragged into
> Images which is not desired
>

We can modify the rpm packaging so that only the library from rpm that
libresolv links with, but not the executables or other libraries are in the
image. Would you be ok with that?

Alex

--0000000000006175ed059e778781
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 13 Feb 2020 at 17:06, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:</=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_qu=
ote"><div dir=3D"auto">No, problem is that if One wants to use opkg backend=
 then rpm drags along but apt or dpkg don=E2=80=99t</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Even if test is made to pass rpm will be dragge=
d into</div><div dir=3D"auto">Images which is not desired</div></div></div>=
</blockquote><div><br></div><div>We can modify the rpm packaging so that on=
ly the library from rpm that libresolv links with, but not the executables =
or other libraries are in the image. Would you be ok with that?</div><div><=
br></div><div>Alex</div></div></div>

--0000000000006175ed059e778781--
