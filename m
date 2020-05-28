Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.22175.1590700368485322361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 14:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f80j7unr;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: gzatko@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id e1so861640wrt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 14:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=x70dQEmkDbMfzWri4PI6Ivku+j3BCI4RJxZVN7zQV5s=;
        b=f80j7unr/CXwwHHh9SgyMDI+J0ipw4j+A8cSc9PDpZvV/VXsWPChVL0wxVC/HiiXN2
         HD7x6L69rMbnBjBd4sNl1NkjmsDf7O8pxhTQSNHxv0icw/GgJ38zBjY6az52ncj9sNRL
         2akMOjGMXnVPgkIMC4ZAgEHfRmQ1WWd6JaDn7wM19Fc7+N0cwJKlM7pAEw53Y1f+ZkYC
         F/F9AJAFwj9FUQ2IwxEjAi9yyWdJAa93/4R6ymYz23cGvHdqjJbxcflJ/4bqLxh8WHs4
         kQpHANVvIlssRe6L3CQGW1nWqG9FNU2yVHXJGLHHTlK6KeE9/4vW6isHcLkXGTHzDJ0G
         wnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=x70dQEmkDbMfzWri4PI6Ivku+j3BCI4RJxZVN7zQV5s=;
        b=PnojUP+gAl+BYwb1Hn/kOfcSA+nHASb6rqcwe8wsbqGkRyktfkA/XCzdq6AAaFln+W
         KWQFV8RlHIhFfCKDLbNnyCN/RTcknt3m7rfeyUPLZS2c0YrFORfbC5N7ob8xnmKmxc7O
         FiqrnrcarPDeBr+Rv+ZUAlvmL44aKa3sY5tdKjpZBmlcDs2JKYRhir1JM1ss4S5kvj8e
         bq7Qzgi2I3/wCLWABisgtRZ0uQ3WzrlrRI9Efe/WWehqs42tosRUMhSp+h6iXzqn8Zgg
         WfjmOqBKTUBJ9RZ91TQyaeEv/0hCC7YjdsVpFKViNcu4oLJ9taSBuD0u7CZwgpkKZ95c
         Ni2Q==
X-Gm-Message-State: AOAM531+XRCNwj+miqKz1ybl9WmBdj7ffGGLZ/bS+DyhkBcpJoEJBwuk
	SmKnVbyD9X87yHSLjpXP8co=
X-Google-Smtp-Source: ABdhPJzTDGjCpOvbG5LVpThsG3KxHHJtx2lTD1JYryhra1CM0UzHmTO9vkKb+fcnqp73To513Mzj9A==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr5049434wrs.87.1590700366408;
        Thu, 28 May 2020 14:12:46 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan ([80.94.50.178])
        by smtp.gmail.com with ESMTPSA id h5sm7383704wrw.85.2020.05.28.14.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:12:45 -0700 (PDT)
Message-ID: <bb3f3198b359a4533193c61736823fd750c04e10.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] docbook-xml: update recipe to stick with the upstream
From: "Gregor Zatko" <gzatko@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2020 23:12:44 +0200
In-Reply-To: <0f497fa917b7831dff5cf53553758d96c18e30a4.camel@linuxfoundation.org>
References: <20200523191238.1224501-1-gzatko@gmail.com>
	 <0f497fa917b7831dff5cf53553758d96c18e30a4.camel@linuxfoundation.org>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sVs+iCNfSPz5Yqh8VHHW"

--=-sVs+iCNfSPz5Yqh8VHHW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-24 at 16:24 +0100, Richard Purdie wrote:
> On Sat, 2020-05-23 at 21:12 +0200, Gregor Zatko wrote:
> > From: Gregor Zatko <gzatko@zoznam.sk>
> > Until now a Debian package has been used as a source.This change
> > just switches it to project's upstream.
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270
> > 
> > Signed-off-by: Gregor Zatko <gzatko@gmail.com>--- .../docbook-xml-
> > update-catalog.xml.patch      | 515 ------------------ .../docbook-
> > xml/docbook-xml-dtd4_4.5.bb       |  65 ++- 2 files changed, 36
> > insertions(+), 544 deletions(-) delete mode 100644 meta/recipes-
> > devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-
> > catalog.xml.patch
> 
> Unfortunately test builds failed:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/2176
> 
> Cheers,
> Richard

The catalogs of versions 4.0 and 4.1.2 are not present standalone in
the docbook.org page.A question is what is the best choice to include
them into the file tree:1) add them directly2) add them as a patch3)
extract from a Ubuntu/Debian package where they are present

--=-sVs+iCNfSPz5Yqh8VHHW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Sun, 2020-05-24 at 16:24 +0100, Richard Purdie wrote:</div><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><pre>On Sat, 2020-05-23 at 21:12 +0200, Gregor Zatko=
 wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><pre>From: Gregor Zatko &lt;</pre><=
a href=3D"mailto:gzatko@zoznam.sk"><pre>gzatko@zoznam.sk</pre></a><pre>&gt;=
</pre><pre><br></pre><pre>Until now a Debian package has been used as a sou=
rce.</pre><pre>This change just switches it to project's upstream.</pre><pr=
e><br></pre><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
13270"><pre>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13270</pre>=
</a><pre><br></pre><pre><br></pre><pre>Signed-off-by: Gregor Zatko &lt;</pr=
e><a href=3D"mailto:gzatko@gmail.com"><pre>gzatko@gmail.com</pre></a><pre>&=
gt;</pre><pre>---</pre><pre> .../docbook-xml-update-catalog.xml.patch      =
| 515 ------------------</pre><pre> .../docbook-xml/docbook-xml-dtd4_4.5.bb=
       |  65 ++-</pre><pre> 2 files changed, 36 insertions(+), 544 deletion=
s(-)</pre><pre> delete mode 100644 meta/recipes-devtools/docbook-xml/docboo=
k-xml-dtd4/docbook-xml-update-catalog.xml.patch</pre></blockquote><pre><br>=
</pre><pre>Unfortunately test builds failed:</pre><pre><br></pre><a href=3D=
"https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/2176"><p=
re>https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/2176</=
pre></a><pre><br></pre><pre><br></pre><pre>Cheers,</pre><pre><br></pre><pre=
>Richard</pre><pre><br></pre></blockquote><pre><br></pre><pre>The catalogs =
of versions 4.0 and 4.1.2 are not present standalone in the docbook.org pag=
e.</pre><pre>A question is what is the best choice to include them into the=
 file tree:</pre><pre>1) add them directly</pre><pre>2) add them as a patch=
</pre><pre>3) extract from a Ubuntu/Debian package where they are present</=
pre></body></html>

--=-sVs+iCNfSPz5Yqh8VHHW--
