Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEAC787CA;
	Tue, 21 Nov 2017 20:10:31 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id r12so11021941pgu.10;
	Tue, 21 Nov 2017 12:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=3uBFX+V7iqcYgZm/a0ftCZtMZoU3HnpQbZ/Tfog7sDw=;
	b=K/Scvo4fwuKr7zAFhSDQXnCIV3e1DDE8y1wd1pTouv2j9HpLkUWAJmi8HQyryezDHe
	vKNgVsqQDjbGi6iegZvjZG6g2sVRcieKAgD+B27S+ejOwCKD4OKlGYw8xcBAwLQr4aAu
	+fAFUXKLVIG0tM4ykTOhtZy1YiYgC3xRpqJDzvEsbhrvx3WrVDVL8Ss5VrrNpHWYmYhK
	vpsmvcuTrC1Xu/dTOdwBSyuc/6yqOOR3cevVA9popwCHUJ/dOVuc0a5sOJKKQ6KwxkIV
	No6RC0D8fUG5KvSLix5LPa/icHBqiU2h0cw8azoXPvECWVpNOuKfkRXrtS1+ca/0wIfL
	EnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=3uBFX+V7iqcYgZm/a0ftCZtMZoU3HnpQbZ/Tfog7sDw=;
	b=ZmTWGSXFt/L7Uhmj61oo9IZVQ9Ggprz+xYj6FgVSCA6YEJWfZxQaeaeFKR8DtgLFWQ
	reUq1EeWdwgWY2VLvwW1lJc0SaWWoFQgA+GCs6HaYFImFw3n3PZNigwye0MshczbDfGi
	1JeBualu2lMSWCA7YriLoIj4QA2vVH+SGL5f5CHz9bXjwwttz6IS2XHtXaBNX4ITXzRt
	Eqoyc7mKN/CJbeDb0BKIy4iwkOU+ficbgWSuOAwelwk7bZqomgE6WgDaJrApfOJhOEqE
	/4ECPe49uxCQanGzj05d+fVIfa8lFVFy+42WTEczZylXnH7eViiTSzdHwi5FGLswu5DM
	4uww==
X-Gm-Message-State: AJaThX7HYzMLi1U/rHrQWP9f6L7hrGyEkci2xMzc1T9OaqmZyLJqd55C
	b5z4pZmOzP9rXr+MQz6r935Huw==
X-Google-Smtp-Source: AGs4zMaQyPO3cwxKWx2OskIIrfzuaC+xImmx8WUhlNWYOwEZIbHDwWLuBlNbyq/oM4wftEpCqCIW4A==
X-Received: by 10.99.121.4 with SMTP id u4mr8711381pgc.235.1511295032542;
	Tue, 21 Nov 2017 12:10:32 -0800 (PST)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	s71sm27500531pfa.147.2017.11.21.12.10.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 12:10:31 -0800 (PST)
To: Hongxu Jia <hongxu.jia@windriver.com>, yocto@yoctoproject.org
References: <bfbfad0b-af40-5448-4aed-fc70eeb95c6c@windriver.com>
	<7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <37b787d0-ef5a-d821-0c09-a8547c58c52d@gmail.com>
Date: Tue, 21 Nov 2017 12:10:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	+lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Contribute meta-installer to yocto
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
X-List-Received-Date: Tue, 21 Nov 2017 20:10:31 -0000
Content-Type: multipart/alternative;
	boundary="------------BDACD15424B5B60F7AB658DB"
Content-Language: en-US

--------------BDACD15424B5B60F7AB658DB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello,



On 11/21/2017 12:55 AM, Hongxu Jia wrote:
> Hi all,
>
> Wind River has maintained meta-installer for several years,
> and now we want to contribute it to yocto community.
>
> This layer provides an installation program based on
> OE platform. The installation program is anaconda from
> fedora, which is the installer of distribution Fedora,
> RedHat and Centos.
>
> The version of anaconda in meta-installer is 26.21.11
> which is based on Fedora 26.
>
> The meta-insatller requires:
> - systemd as init manager
> - python3
> - dnf2/rpm4
> - gobject-introspection which requires qemu-usermode
>   in MACHINE_FEATURES
>
> The meta-installer provides:
> - graphic install and text install.
>
> - package based (dnf/rpm) install and image (copy)
>   based install.
>
> - package based (dnf/rpm) install from local and
>   remote rpm sources such as CDs and DVDs, images
>   stored on a hard drive, NFS, HTTP, and FTP.
>
> - kickstart install which provides a fully unattended
>   installation that can be duplicated on scores of machines.
>
> - install over VNC on headless machines.
>
> - timezone setting.
>
> - root password setting.
>
> - user account creation.
>
> - a variety of advanced storage devices including
>   LVM, Btrfs, Ext4, and filesystem encryption.
>
> The repository of meta-installer is temporary on the github
> for review:
> https://github.com/jiahongxujia/meta-installer
>
> In above github, the logo picture is undefined, if yocto
> could accept this layer, I will update the picture with
> "Yocto project Compatible".
>
> The attachments are the snapshots of a package based
> installation.
>
> Hopefully it is helpful for yocto, and any feedback is
> appreciated.

I believe it can go beyond helping Yocto and help the overall OE community.

CC'ing oe mailings lists

>
> If yocto is interested in this layer and will accept it,
> I could send pull request or some one directly fetch
> from above github master branch.
If Yocto isn't I am sure OE will be.

Thank you Wind River for contributing your hard work for the greater
good of the community.

kind regards,
Armin
>
> //Hongxu
>
>


--------------BDACD15424B5B60F7AB658DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello,</p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/21/2017 12:55 AM, Hongxu Jia
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com">Hi
      all,
      <br>
      <br>
      Wind River has maintained meta-installer for several years,
      <br>
      and now we want to contribute it to yocto community.
      <br>
      <br>
      This layer provides an installation program based on
      <br>
      OE platform. The installation program is anaconda from
      <br>
      fedora, which is the installer of distribution Fedora,
      <br>
      RedHat and Centos.
      <br>
      <br>
      The version of anaconda in meta-installer is 26.21.11
      <br>
      which is based on Fedora 26.
      <br>
      <br>
      The meta-insatller requires:
      <br>
      - systemd as init manager
      <br>
      - python3
      <br>
      - dnf2/rpm4
      <br>
      - gobject-introspection which requires qemu-usermode
      <br>
        in MACHINE_FEATURES
      <br>
      <br>
      The meta-installer provides:
      <br>
      - graphic install and text install.
      <br>
      <br>
      - package based (dnf/rpm) install and image (copy)
      <br>
        based install.
      <br>
      <br>
      - package based (dnf/rpm) install from local and
      <br>
        remote rpm sources such as CDs and DVDs, images
      <br>
        stored on a hard drive, NFS, HTTP, and FTP.
      <br>
      <br>
      - kickstart install which provides a fully unattended
      <br>
        installation that can be duplicated on scores of machines.
      <br>
      <br>
      - install over VNC on headless machines.
      <br>
      <br>
      - timezone setting.
      <br>
      <br>
      - root password setting.
      <br>
      <br>
      - user account creation.
      <br>
      <br>
      - a variety of advanced storage devices including
      <br>
        LVM, Btrfs, Ext4, and filesystem encryption.
      <br>
      <br>
      The repository of meta-installer is temporary on the github
      <br>
      for review:
      <br>
      <a class="moz-txt-link-freetext" href="https://github.com/jiahongxujia/meta-installer">https://github.com/jiahongxujia/meta-installer</a>
      <br>
      <br>
      In above github, the logo picture is undefined, if yocto
      <br>
      could accept this layer, I will update the picture with
      <br>
      "Yocto project Compatible".
      <br>
      <br>
      The attachments are the snapshots of a package based
      <br>
      installation.
      <br>
      <br>
      Hopefully it is helpful for yocto, and any feedback is
      <br>
      appreciated.
      <br>
    </blockquote>
    <br>
    I believe it can go beyond helping Yocto and help the overall OE
    community.<br>
    <br>
    CC'ing oe mailings lists<br>
    <br>
    <blockquote type="cite"
      cite="mid:7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com">
      <br>
      If yocto is interested in this layer and will accept it,
      <br>
      I could send pull request or some one directly fetch
      <br>
      from above github master branch.
      <br>
    </blockquote>
    If Yocto isn't I am sure OE will be.<br>
    <br>
    Thank you Wind River for contributing your hard work for the greater
    good of the community.<br>
    <br>
    kind regards,<br>
    Armin<br>
    <blockquote type="cite"
      cite="mid:7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com">
      <br>
      //Hongxu
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------BDACD15424B5B60F7AB658DB--
