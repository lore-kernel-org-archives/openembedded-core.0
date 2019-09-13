Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 63A6A751D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 11:59:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b10so13197423plr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qUCk3HABnS1BD5KUz1sDRqmR2Px4/67tKL4JCFPBBkY=;
	b=HeMgfc98/SzEY4nRYObJErvKImHPA3L4GQzqzLZjRcW3eTLCoobxRgqrsx3ALN5GHF
	B3eICGANwqZgzRacpJ8lRylMDUAZ+tzr+Ky5iaFNJzOPO3/s93+9HNLMN2UcEgZMxe9l
	Av+PAk5l3SztRgFA6PEDXSCQhEfjZCZF85KZwv7vbaiygOlbzLFqKOcXp9PtMr4ZJ52J
	rMjAJFjP7iS1MSjWheNMi07TcU9N9FEq3fW0YAJguChYcDXLZxf9/EPe4+zZpuRdRmyf
	pISonlQPLx/rF5ov/a/N83JNAJetvJiUfVG1CGPkDgyKbDTv8fPzIFs7TxOCZ67G1yfi
	J/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qUCk3HABnS1BD5KUz1sDRqmR2Px4/67tKL4JCFPBBkY=;
	b=Qxkb6HFTH8BmwOS7+l8y3qEwhVrQN2dblrfkflFx46rV9bFtfthN9ih1fKr2GFnQhj
	fP/CdgW59oRQOP1jcpgD5HW0ndft8M5ey/9zoAwMFbs6sE+f404fwq5s199wLKzstx11
	iCyYa/6jd6uVTmJiEseXd1W/C7s/xfvqLUANuntG173dELRV6ZBTuAbz7Gebe5s+8gS+
	FBrONchcLIShJXqJgyHR+pUMUiOiwjmSWRlerz/3N/OvtBRCnUPTz9p0lFFNEPpz5cig
	SG0XzI3w401dVkcWcz0nTXumIBXfZuufKGUie/VPoshhvBz57EgNxAfHUVNML3FI9lOo
	0Fpg==
X-Gm-Message-State: APjAAAWvcECMsmSG4iuNwIf6vzx4GoxaoMLilqTanparOkw7BZTVXeXM
	yFsSYd5DIkM413Bcs2O6zAWRfLUQZgYpEmwh/3Y=
X-Google-Smtp-Source: APXvYqyAGwsffX802GDpJAa9uf1wW371FM5jwJ2Xzqvgs4kVPEJivy7cmkEkKVhWizqeD8/oLyPibIC0YyXFscIZ6d4=
X-Received: by 2002:a17:902:76c1:: with SMTP id
	j1mr613110plt.270.1568375984371; 
	Fri, 13 Sep 2019 04:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
	<59fae086ca25abd545f80067c6824c752bce0f86.camel@intel.com>
In-Reply-To: <59fae086ca25abd545f80067c6824c752bce0f86.camel@intel.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 13 Sep 2019 14:59:32 +0300
Message-ID: <CALT56yPjxZCfP+z3aJ8tUHr3WFQGzyUBQau7te56GeQOPY4hYQ@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "dmitry_eremin-solenikov@mentor.com" <dmitry_eremin-solenikov@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Fri, 13 Sep 2019 11:59:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 13 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 02:12, Mitta=
l, Anuj <anuj.mittal@intel.com>:
>
> Hello,
>
> On Wed, 2019-09-11 at 12:29 +0300, dbaryshkov@gmail.com wrote:
> > From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> >
> > Create new bbclass defining common variables for all UEFI-related
> > packages (bootloaders, test applications, etc).
>
> Have these changes been tested using wic as well with non default
> values? There are places in there in EFI plugins where EFI/BOOT is
> hardcoded. They might have to be changed as well ...

This would be the next step. For now I wanted to consolidate code
in recipes, so that it won't be duplicated all over the repo.

--=20
With best wishes
Dmitry

