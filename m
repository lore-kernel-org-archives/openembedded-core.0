Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgHRX-0008Lx-AR
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 17:03:27 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 07:48:15 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so24282242oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=QT23VZAFtrodBBrDSzrbvGQ1xs1UpdJqQ0j4wHIqD58=;
	b=ciXOkP3TfCXrjPLD6vtyfsOyxn7MpFlw44BgJZcxQ7pjL4qohjT4QcuK/9hlLEX8Ee
	4btBiyV4oEBORM8mRDPlqAO+TliHGdtHTxOZBQLYE0JHcMa6ffIQAVyPE/i44VmC8RA0
	tB/X9jIYtvBBgYyhnL56fQcbM/yYswxXu8xBSrrHUz/BPfKdSFmWdDE/NWGW0m2jbBZb
	92y2CmpUfiYWzTMvK5TvxlNgHtprT7ouRDCWItXqTGP8XVFwZiTd41j7LJ5LS3igOZNN
	6p6aAHxXFQgTCl76Fkcfn5uASq4Va/4DircfGtLYpYcq94E0jvrYWOZ855nbSYGTJlzt
	F9Cg==
Received: by 10.60.169.171 with SMTP id af11mr14188146oec.92.1354722540416;
	Wed, 05 Dec 2012 07:49:00 -0800 (PST)
Received: by 10.60.169.171 with SMTP id af11mr14188138oec.92.1354722540331;
	Wed, 05 Dec 2012 07:49:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 5 Dec 2012 07:48:40 -0800 (PST)
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Dec 2012 15:48:40 +0000
Message-ID: <CAJTo0LYjTzrvDgDXA-r1f4B8+-TSfv1tUkC-Hyw_J-2toHEQkQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQmyW60w2fNjrJisqE2V/CHrgjPspxITdqP3bVyHSir+OMRWe2g3seSacC4Hx2GpVSfif1/3E7BGNDJg7aOJUPKuwYDXCrek0K9MDUC8WcCgT8W+z6s3i42DqSeF34VXmu6Bc+9ExruaoUJaAYaO1wME0QAvJlmks1baOZszgKMq/QlJAfSVvWUueRBjtCptqs21cHxE
Cc: dvhart@linux.intel.com, linux-yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] linux-yocto: consolidated pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 16:03:27 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2012 21:32, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> atom-pc should probably be using the 3.4 kernel, but that's a
> question for Darren/Tom/Nitin (so I've added them to the cc), since
> there may be a reason (with respect to graphics) as to why it is on
> 3.0.

Ping Darren/Tom/Nitin.

atom-pc is certainly lagging behind by still being on 3.0, and I can't
see any reason why we'd want to stick with 3.0 for graphics.  In fact
as the most common graphics driver used on atom-pc is a i965 we want a
modern kernel as that is where the development is.

(this may explain why my GPU crashes when I stress it under Yocto)

Ross


