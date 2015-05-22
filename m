Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f53.google.com (mail-vn0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id E4707609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 11:37:12 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so1053455vnb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 04:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=4vZiFJrlyv3ZPLQvbNPabJs1Gh+hxPtw9QlxfI0JUYc=;
	b=Q4nV4t7sroXriuTwKY8sr6q0sjDUU+2pceYLS4I2ghxRfTSGvgzz9Jz6YExKWn8gHG
	5Qkjf4CHPie095d+qoTvOYy5UHTSNbRt5obpnst40nLBCfFXn0hz6f+/4yTTA5U7MfxH
	C5jIYGumFGvqa6t+6LKG5aKbl6Hid15iXdHDQ3J9kZx1rpQi+mRZVUGt4bI5MLLzz6cg
	MrB/k9WLLYkBmt65Lk8x6odXZhrmvJ5p09hAXUJRqhXOZnr2mAe8i6rrYgceWQDGUcJZ
	cHaEbyHqkV/9dsM79EfLBIYn4M0rlspOx/oulrWZ3IH99LnHBTR6E+EAE0h16aL2botb
	7Fkg==
X-Gm-Message-State: ALoCoQnAf/b6kwqlWXb7scr6ahrACU0SWk7cE41ns7AB3wlQKV53QYPq3Rn/dXlIW3GCfrk4c3nP
MIME-Version: 1.0
X-Received: by 10.52.90.4 with SMTP id bs4mr6884568vdb.59.1432294633567; Fri,
	22 May 2015 04:37:13 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Fri, 22 May 2015 04:37:13 -0700 (PDT)
Date: Fri, 22 May 2015 12:37:13 +0100
X-Google-Sender-Auth: kjo_R7UnwgQT3-M2xPB1itC4Dkg
Message-ID: <CAOMwXhN1Ww=T_OJC8e-VtzM_OozOQUjCU7cF1-shUMZ_kVG4Xg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Post USERADD_PARAM action
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
X-List-Received-Date: Fri, 22 May 2015 11:37:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

is it possible to do some post action after useradd_param is executed?

I would like to modify the created user's home directory, in this
special case the profile. I see that the useradd util has this on
desktop, but busybox does not have it, and very likely will not have
it, at least not in the near future anyway:

       -k, --skel SKEL_DIR
           The skeleton directory, which contains files and
directories to be copied in the user's home directory, when the home
directory is created by useradd.

           This option is only valid if the -m (or --create-home)
option is specified.

           If this option is not set, the skeleton directory is
defined by the SKEL variable in /etc/default/useradd or, by default,
/etc/skel.

           If possible, the ACLs and extended attributes are copied.

I would like to do something like this with the created user's home directory:

echo PATH=/sbin:$PATH > /home/foo/.profile
chmod foo:foo /home/foo/.profile

But then again, for this, I need to make sure that the user is already created.

Ys, L.

