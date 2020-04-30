Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web12.467.1588280514936579691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 14:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bxiXYQpE;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id 10so2213082vkr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 14:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKZlZtnHYrDq3/UWyOeium/sVpBlQqHTpz1B9DHWO/8=;
        b=bxiXYQpE3AjBkpx5K9gppqfMQxEGGDzr6NNmnWiUbvWAnSXmKZn9Wa9vrvHqFFxMPR
         rB7gjZySDu2op1vGU8uv/NuGMWGihhGxJf7JPB8jaVMkxpCTE56Xe5j0wYuF2gU/T9JF
         MkGlo5+wFEeXfqyM6GeeEIHwP/X3EcOO82GUvCsdP5kNVQu8KLTzw+dVDh+zrrZmQKgC
         mwX5Me4n/brXubLMEIKa2kj1QxST8Fk5rdyDlPNo3X+M4nE8bQPjq8LGKFy4KNH+lDJ8
         xDN+m7ZRLqURbzrj6LI9OSeVte5mYI0pzSAt+ZRy9b/tFm7z9RfNTKHOp2yArbQ0Ed9P
         tOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKZlZtnHYrDq3/UWyOeium/sVpBlQqHTpz1B9DHWO/8=;
        b=g63Ux1MdFj8cXcYXw22kmf7q8vX4iOwO6FneUGlXNcN+sArOPtOngOUprvp46GSPcp
         7wvtalyKbh98Q4/dqRNQceoa1ItK6ejr5I22/Fye/qosGcithSQ1yq9O43ZRf2QX/wD/
         5trQtmg6mE7s3GK8QcF77pqD4YavicbBVhPUOA+NcY2yZbXw0qJNxZmKvegzftY02CJA
         /EYgdtESH/XZMi8CtQMA4fdPQJfavUeQQWmfUCp/z+GHGBCBRR7fvCSPzl3l20HgnzEN
         WOdVrPM2UiHTypuWjpb6l/VgBuTuGGyMYayBRCtIkotA6W06MHtLoTAkn4Aeb6V758Ee
         hDDg==
X-Gm-Message-State: AGi0Pub9rrr7eNMECYtikWzEJQMBAMgBvP2JJ3n1hMu81yW+Bd6Osw48
	zitXWOI3VfKfG/J4NZHko5bCPPUz4uVj0u438rc=
X-Google-Smtp-Source: APiQypJTtk67E7uFFkjfetc3ZjCqEA+u2rwMqhyCtxskRBAmDdmTdESFMHOVV8XLrPtqdEJ1vX7YnZPU/dLmMONNrRo=
X-Received: by 2002:ac5:c810:: with SMTP id y16mr447384vkl.49.1588280514123;
 Thu, 30 Apr 2020 14:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com> <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
 <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com> <CAJ86T=XR+CWD8T=HLXUrfwUoiOjcwf2sifb1B4OWT=76OzKjQA@mail.gmail.com>
 <CANNYZj-TcGD6QJ1Vnjme4fpZ4uwQB-LAZ-coaSm+jXsjiPHe4g@mail.gmail.com> <CAJ86T=XEgKFR8=Aw9Qjv6KAG1C64ei8cMueS4SFFSP3yTaUTFQ@mail.gmail.com>
In-Reply-To: <CAJ86T=XEgKFR8=Aw9Qjv6KAG1C64ei8cMueS4SFFSP3yTaUTFQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 30 Apr 2020 23:01:42 +0200
Message-ID: <CANNYZj8bEssDO0D56boqmTHt+G=nSf9-ziOarnHoR7zqsg3JzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d91ac705a4885f83"

--000000000000d91ac705a4885f83
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 22:46, Andre McCurdy <armccurdy@gmail.com> wrote:

> AUH is a great tool but it does seem to create a division between
> those in the exclusive little club of recipe maintainers and the rest
> of us. If you want to reduce your workload then maybe you could remove
> yourself as maintainer for some of your recipes? If that leaves
> recipes without a maintainer then maybe they should default to
> "community support" with AUH emails being sent to the mailing list
> instead of the named individual?
>

Actually that may not be a bad idea. Listing maintainers explicitly and
sending them private email just doesn't seem to work out: many of the
currently listed ones just silently ignore AUH mails, and don't bother to
unlist themselves, and those who do act are an exception. So those many can
be replaced with the oe-core mailing list email, so the patches (or
information about why smth couldn't be updated) end up here, where
interested parties could pick it up. There'll be a monthly avalanche of
proposed patches. Thoughts?

Alex

--000000000000d91ac705a4885f83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 30 Apr 2020 at 22:46, Andre McCur=
dy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
AUH is a great tool but it does seem to create a division between<br>
those in the exclusive little club of recipe maintainers and the rest<br>
of us. If you want to reduce your workload then maybe you could remove<br>
yourself as maintainer for some of your recipes? If that leaves<br>
recipes without a maintainer then maybe they should default to<br>
&quot;community support&quot; with AUH emails being sent to the mailing lis=
t<br>
instead of the named individual?<br></blockquote><div><br></div><div>Actual=
ly that may not be a bad idea. Listing maintainers explicitly and sending t=
hem private email just doesn&#39;t seem to work out: many of the currently =
listed ones just silently ignore AUH mails, and don&#39;t bother to unlist =
themselves, and those who do act are an exception. So those many can be rep=
laced with the oe-core mailing list email, so the patches (or information a=
bout why smth couldn&#39;t be updated) end up here, where interested partie=
s could pick it up. There&#39;ll be a monthly avalanche of proposed patches=
. Thoughts?<br></div><div><br></div><div>Alex<br></div></div></div>

--000000000000d91ac705a4885f83--
