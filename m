Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 516486E630
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 18:11:12 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id qo8so14552055pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 11:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=qU+YJ/+9vTSHTBNYGVI2JPf1R4boqj3ji6zD8nmGVYQ=;
	b=E8aMrHRdw2tkxJPcPMu5rXwglMwKp6m5EJAWvBUR95F/ResCZMTo2rlg8Bw2NalTdf
	yq5q9rbTBWPY9+tCztCMkdeMJSi2I4ehSmB2UzW/jyTW86R0Tbhh+p+5/BUe5mTvqBwT
	uHBPxVZnIB/lxcz4mHT9i9sdPXHIP8QrQH4PvbSKXIDssYRq4aOkwupH09ihmA0SN6UU
	DdP7QMLmfXVf059q908zWol9qjRGWP4IZTM2cTNTH4EIdEFI8LPb4zh7X9FAlw2UCaJC
	Xe0mCW2OSV4rqOoT3Ank207k0DTqwKm4RKkEdqLk7BcRDrHulqq2CrDyJtiqMLBSdsIm
	8mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=qU+YJ/+9vTSHTBNYGVI2JPf1R4boqj3ji6zD8nmGVYQ=;
	b=EtBk4L8zOcnHplnrcsLcXC5sE6q+UOdqW93J98tJs7udkCb+qMpqAQtjHpFdcOgeOD
	JaSKoGsbpRpXjg/2Maupmst3w/yXrDGvv3Di+D9PE76IuvwMQCde/hZnAQpOFs/zH1LQ
	VctfqtAZLd90VNeJyCfXuhjZgtr7TjkWraq5zHkkib5TccFZOYNwnHBmefTMZp5aZ0HZ
	b7yNhczEM2Wgz98ypuUz3FcxJaepCkrdZfjd/MFC4xAvceLaCMu4jVLr1NNrOl6BoiQM
	GgCoyc8pOvY0Jptl/kDzviKyidfZCeGJcoRP8XheCmgkB/r0VgSLJuU4XunVTsFlxx2O
	Zewg==
X-Gm-Message-State: AOPr4FVh0b+ccCPKaqBUBBKNiOLlV/EeYEoeFmf+pw6mUm4m8bHM3gzT7mYkt5WPfrd4Pw==
X-Received: by 10.66.132.103 with SMTP id ot7mr39347483pab.27.1463335872920;
	Sun, 15 May 2016 11:11:12 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:a10b:de98:ff76:b232])
	by smtp.googlemail.com with ESMTPSA id
	yv7sm11163634pab.31.2016.05.15.11.11.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2016 11:11:11 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5738BBBD.3050407@gmail.com>
Date: Sun, 15 May 2016 11:11:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
Subject: Branch Maintenance process clarification
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
X-List-Received-Date: Sun, 15 May 2016 18:11:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I am reviewing the stable branch maintenance for Yocto and would like
some clarification on a few steps.
https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

6. Split out any bitbake changes and send them to the bitbake-devel
mailing list (marking them with the appropriate stable version in the
subject line e.g. [1.20])

AK] I have not seen this being done in the past. Should we start doing
this or update the process ?

7. Split out OE-Core changes and create an openembedded-core-contrib
branch containing them; send the cover letter only (marking it as such
in the subject) to the openembedded-core mailing list.

AK] I don't have write access to do this, so this will be a problem.

8. Split out any meta-yocto changes and create a poky-contrib branch
containing them; send the cover letter only (marking it as such in the
subject) to the poky mailing list.

AK] Is this required?

I do agree that the downstream repos are where the changes should be
pushed first  then feed poky. This is not what I have seen happen in the
past nor did I do it for dizzy either.

regards,
Armin




