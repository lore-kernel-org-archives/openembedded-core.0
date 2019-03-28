Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id A0E157D1A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:38:50 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id g17so6363285ita.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WlwaqiBL20DGZAiAoQ7ym8L/4CvjLYxnQpRXwgp2EWs=;
	b=Dvdd0vuk1yvbkn6ywoxGWFQ0a9kKPM6DzG8Z2idl8Ga/ZB2NgtFIooBe08MwCWhRxu
	C6g8H2ZhtIxxpmRWDxlQ+EaEGYx90xqCbPJ/VMEf1p6Tm72AowdGIQ0nvtV+m9+r9FMJ
	3wAReY9JRy86e3U3r/wf8/80RJaeMWzKJ9D4aiJmnoIIkWBWjD3SJJtMNThWZjloOOLh
	gRt49lAWet6D6KwJpEu5wY0h/4gDpegZuKeezeBOxPeEsynIHwCf7qw11Y2wYeFhk+1w
	58hAANIKAA5nnVk2mrvGphptuKweGkaf7PW7r+ypfXCDhxZmGOBzHFYVRml2t/MLs4rt
	UtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WlwaqiBL20DGZAiAoQ7ym8L/4CvjLYxnQpRXwgp2EWs=;
	b=qW7g6VnCpAtkQzkDEDtto4z0f1BbBcmiCEinDkH1+uwMR5FTWY8edDyQrAahWchiNz
	pPZM3q7dGDlCDcOn2VClV5SZYX13YIJ6WiKLfVel6OJWe66z3MIASTitJDIu80Bms8j2
	iPz+ChzBwJd4hk6V7PmiVg0W0AOd5Y8yZNJ2MryTI+ZCmyb38P/MmD7dMEnmE9qe0RwY
	7PqvTr5PFHcY/yneoN/lm324A+FlaiStmKYz2o+hy/EE53nC1Sar2B5Cer3Kxr/7LC52
	9qmOACMeiuG37cUtQyq3smYqeqU+XgLS/Gr1+ZO7o3SxTFgjsF4nIlQRQq3XHvRlYnFw
	RjIQ==
X-Gm-Message-State: APjAAAWFwjbiF5oGgaBcpgR+scbrwkeWTgsUb0Xl5gXlb255x3qEPU1C
	kfzL6xv1HSePTHJp8j5LPO/1LlbO7+w6WZM8PQ0g/QE1
X-Google-Smtp-Source: APXvYqy3zAREqvRi4Pa9iyqQ3tA26nopJMiP4w6P+UtqBUgYb+dwJas7svnHz0OcCVDI5n/P7nw5L4xSujJjPDITStY=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr302945itj.62.1553783931727; 
	Thu, 28 Mar 2019 07:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
	<20190328134644.GK18421@bill-the-cat>
	<CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
	<CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
	<20190328142524.GM18421@bill-the-cat>
In-Reply-To: <20190328142524.GM18421@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 14:38:40 +0000
Message-ID: <CAJTo0LYS1ajNPiexSYKK=T9nTaEJ+XkzLvAKQv+7L6cDdUE5dQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 14:38:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 14:25, Tom Rini <trini@konsulko.com> wrote:
> Bumping PE is what this is for too, to not break package feeds after
> we've done something wrong in PV.  So lets bump PE and not break feeds.
> Especially since this is so that CVE check starts to see and correctly
> complain about issues that will result in "lets move this from master to
> ..." and so break feeds.

Bumping PE is a nuclear-armed hammer when setting CVE_VERSION="2.32"
is sufficient and will go away when we upgrade to 2.32.1 onwards.

Ross

