Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id C1F5C79BD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 16:18:47 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id e17so12793706itk.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=85EIA6kvXmKYJN8rZeTOerJScf5ArnMyRx4ho5ZACm4=;
	b=v4odv0GPX5sZ0jgdcWsVt2X99uMbSaPzTV+q3x2jJ4v7xDE8AzN78O/goIfMI+CSXX
	LK2gkNG0t257/T93WmpLoxuFt1UJ0aRYj+zTTzjFriDKk7ppU+Wh0/EZwiU52UMlm8WQ
	Y4NAmyIAEkRJzwVbzp1tmUuvBAd8wY0uniwZOpxETMX6UmMcXuC685w7aK28U2TgEeHU
	j+VfDDGtftBoqucvHeYsqWyHPuLf6/+T5wRZUkCp6gjxCGyy4XF42HQdTtzcGYItCCOP
	Lu+VIJt1psuVfemK67DHCROjWhpJ3BPeG99NVFSz/OPQvASdUDC76Eo28D1R+jqMOdiJ
	2Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=85EIA6kvXmKYJN8rZeTOerJScf5ArnMyRx4ho5ZACm4=;
	b=Jhg6JXAo7NwYeqZkXUHjXp43eS6qvk5II43R+BGj/F23Jed77gmgz+NyBcGXFlnGC6
	T+tqivDJi8nRpwYoqv8zESQDOjUcrIam4JjgDtiOqW8VT8ArV49MrWquzYz5kbsCdbYh
	H5K5BBWuW793MTEuOmiGA8zHcdSdJIfNgeeg7oF2Y0jg/c5WIZ+/YgYJiT3f3lPULbtS
	OZiSuKhDNRwsZFsB4Rkjc3xAgTBHJ2/PsP7hTibA0105kBNMfNQZtV1jc7CZSrS5zUbY
	11yu7rX43NXT3a5HWaLMMoCjHeeX9M3eRc/GZVL9NQJZbpX9Tz6Iljm7leZbgSWPf0rS
	0Fmw==
X-Gm-Message-State: AGRZ1gKlUVJe4CpCmjqGMBrOpapNfqEZMRUIPdAjGaUZxuOoRYOHLcnP
	4D7CVEucUDdYQlpmcJlDpGtOk7GyX6R4ILlo04TT2zRxjjU=
X-Google-Smtp-Source: AJdET5chgcpgoE05XM8qOR947ii6N8ieFA1Xycf4/vqCvFPWqdP9XW3rgIy/VPBIVob+TFJ+ue4/4Rs3hGWlU+9YiuU=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr1694078itd.26.1540916328779; 
	Tue, 30 Oct 2018 09:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181030093655.26251-1-hugues.kamba@arm.com>
	<CAJTo0LZsRLrwRTDyU6iFHjdm6PwajpLjRN3RbufZLuik0bCdxw@mail.gmail.com>
	<VI1PR08MB36316D19DEB81B04D36EE6C798CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR08MB36316D19DEB81B04D36EE6C798CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 16:18:37 +0000
Message-ID: <CAJTo0LZeQheF0VN=cOiyu+Ju6=38uCUBjv_=oRSgJmMP+cuM4w@mail.gmail.com>
To: Hugues.Kamba@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Tue, 30 Oct 2018 16:18:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Oct 2018 at 16:13, Hugues Kamba <Hugues.Kamba@arm.com> wrote:
> I am not sure where you saw the commit message say that pyvenv has been removed.

The python3-pyvenv package is literally being removed:

packages/corei7-64-poky-linux/python3: PACKAGES: removed
"python3-pyvenv", added "python3-venv"

Ross

