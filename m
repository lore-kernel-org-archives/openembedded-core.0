Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id CDAF978295
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:39:57 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id y15so6733980lfd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+7yrLnxC0mqYiewVn/QzJePFFJsZUEyxWsIicaP1p+U=;
	b=Fcuf4I1PqL3fI9LNTWfCHHv8N8WwzM7d+V2OgYW4WtBiJYGbr93oWwDoGnQBXBvhBq
	reOqdwqlFY6DzPhMfD6XxImc8mXWAgYbAS8eMSgMhdTgWLpMSeG7MCZKaB895Xh8BKiA
	8Z92tUJP8/+yQC9FCx0rpPzgHQ/aJKimhkcx2BlcOB7iDsMRPHAPgoe0T8DGSekoCMeB
	IzXbf3KaTCB+8Iuk7YIZMKIlRxrKIQE8OoS09dW95xSWCwEGT7DUZJpZc4oCx7b44Y49
	7kbsPf7lC1Z+z+Us+refGe9B66jufmkd1FJyMvGItyhpcS4HiFEREE2AZAXZN9Vz9WB5
	HF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+7yrLnxC0mqYiewVn/QzJePFFJsZUEyxWsIicaP1p+U=;
	b=ckvTRcAdOyIO2FCxRyAvIo7MNp7O7pLOJF4LgledxR+Z6LKDdOZ3GaSDQRP7haCv4b
	68qwxd+msvbJ9w90GCdm5XAL/iuEil04940Qqlvz5Tf0G+Yh6WoX9adOFmGvYyYjquKQ
	MdlsrPDVuDQp9s9v+x7+9zWnyVsoXCb2PsEXVb4YNaWCX8Rbybx90iWKV9Y5RTprMgH+
	8u0aznXLSu5ReMwnSJUXCOyk8ggwMJIDxbbyYGvF3V4/Nx/6e6687FgjgwgFlXwtraxf
	vRhdot3zZMIS9emKR422njI7tktar5uQ9iJSOttD5kuz//6nvMcxC2zmxddkR7AfAZjm
	dDSQ==
X-Gm-Message-State: AHYfb5g2ySTZiVJkvLfANZxKHWY1TvMQe9BhiM1NVw+6VN6Chvjbilyp
	5GotAxgQDUAuJi5CxIrIfA==
X-Received: by 10.25.159.212 with SMTP id i203mr1148532lfe.17.1503491998446;
	Wed, 23 Aug 2017 05:39:58 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	t23sm240966ljd.40.2017.08.23.05.39.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 05:39:57 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 14:39:50 +0200
Message-Id: <1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
References: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
Subject: Re: do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 12:39:58 -0000


I don't understand why I'm getting patch failures. This is rebased to
cutting edge master. Trying one more time...

-- 
Kristian

