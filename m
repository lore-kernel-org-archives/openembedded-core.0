Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD4E6C046
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 09:01:21 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id i3so3913523vbh.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Y7I2iMgBej+Ui92xFgAJluUNks0QfM/BjBFsnDZlKW0=;
	b=MMkOx0+fVmnpyCdmewqochjcjB33GedZOlgIoA8bregbpWmkZAvyJkfCwEMrygnRnU
	xrKR/6tNPmLePDEHGuIA4I5dlb80HL08IEszbpviOSf0mmQJzE/QZ7eZVQN0VwXvft8L
	app0szj+h6OSDaGsU0+3+DbLT3XbaiRhDSUVRvZV0g/QYmhQnUKXpHrUuCwPTL9oqb2+
	y+rkNrwWzs+nRwnx4qwVKg8OMOKTrZT2kybumZuXjmUxCUHoub0DL2YGcBg3Chq6DnVG
	mGES7+DTR+NX6ytdybXxpoi+HKgTntQlo/Wex9ZqPiEEmZNNyx0Goa/k7lvbVS8LVxr4
	ZBog==
X-Gm-Message-State: ALoCoQlnw//NcuIxmU/uAzVjaXfSO7uMXXmLhSTXYcG22/ckjs+cJPdCD6MwGLqOWCpQaQdjNv14
X-Received: by 10.52.100.202 with SMTP id fa10mr186101vdb.0.1381222883082;
	Tue, 08 Oct 2013 02:01:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 8 Oct 2013 02:01:02 -0700 (PDT)
In-Reply-To: <1380726432-25519-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1380726432-25519-1-git-send-email-muhammad_shakeel@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Oct 2013 10:01:02 +0100
Message-ID: <CAJTo0LYSD5R3E6acsZQxHd1AKOLqwSx54cXbYfW_RNO6owoY9Q@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: ignore result of opkg configure
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
X-List-Received-Date: Tue, 08 Oct 2013 09:01:22 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2013 16:07, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> Some packages may return error while running opkg-cl configure, during
> first boot. This will fail 'ExecStart' and 'ExecStartPost' will not run.
> Without 'ExecStartPost' opkg-configure service will continue to run on
> successive boot attempts. 'ExecStartPost' should disable this service
> after first boot irrespective of 'ExecStart' status.

Isn't there an argument that the current behaviour is right?  Whilst
there's still outstanding postinstalls to run, continue attempting to
run them.  At some point they'll hopefully succeed - the original
failure may have been an ordering problem.

Ross

