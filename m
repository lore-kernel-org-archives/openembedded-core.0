Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BF5F16CA27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 02:03:34 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id z10so3235314pdj.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=/SGVfeevsbm+5MlDupKBVDc3O/IEuJ/7zOXspeAhJkw=;
	b=nZ56YC6Kab97T0OUtTIS6jHiQK4jOZKyEDW4m38wdyUeJ5Q2OxYmEhTqdDs+zT40KJ
	/2E+z+AY8z7Pih8LwibUceK6dE3sxv8iUXKdYTrlGepKAgjjxIexkJXg3CSFaVfBqgzp
	RQZG8fZhN6Bo6N/enmx3z2HzHdnKRT1vwePYB46+dndBuNykLMce2Y1Cjte4zQolTl3B
	1S6JGLy0w+/xc06KY6/BDq9CA8zdAtvX0ELxg13B+TbdnFdVbMfzMqNcVJu1iLRWuZHJ
	osjiL8rmZvQj6wcLYkQ+ykkWWm0gjDoS/FIabIo6tnxJEEBcHQm5nMZS4uqdWwrC5Lc1
	DnFg==
X-Received: by 10.68.178.197 with SMTP id da5mr24617059pbc.28.1383012216548;
	Mon, 28 Oct 2013 19:03:36 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([180.109.90.203])
	by mx.google.com with ESMTPSA id
	qp10sm38658747pab.13.2013.10.28.19.03.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 19:03:35 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2013 09:56:21 +0800
Message-ID: <30066142.d1P0qLrInV@yiqingliang-pc>
User-Agent: KMail/4.11.2 (Linux/3.11.6-1-ARCH; KDE/4.11.2; x86_64; ; )
MIME-Version: 1.0
Subject: systemd getty
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
X-List-Received-Date: Tue, 29 Oct 2013 02:03:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,
	my QT app can't response to key, when tty1 hold by getty.
	how to disable getty@tty1.service when generating image?


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

