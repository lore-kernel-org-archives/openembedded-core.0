Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FABB6E616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:46:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z137-v6so2160358wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=dgnRqIfKyOTTT4iaW8C/l8GoU5HAro6do6s+XbGqfFI=;
	b=HECjUmX+0GC1VRpHx5yLKWI8NJmRZxHL9/Y8WGQ4VFRMxgF7VuycnisbpeoRzrBz0j
	M+F/mJNZmfy281nkc3U0ASunyLN38yCcS7jG8wfDlq3K1ipRUF64HT0AUpafsYxiGiM1
	vu5NHgnVUK4BwvFnjan7YLc9v5LX/4D603Lfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dgnRqIfKyOTTT4iaW8C/l8GoU5HAro6do6s+XbGqfFI=;
	b=CCtkShhEpz36v7feKB6zt0Io1TfaYT2T8h1HVw5I6MeNuX/zN7du0OHaHebdDnCvk7
	4AaykF3szleToIpTaaqu2WqgUeYQaqndqEwigvau4qCQRQiXAoh2KnIevacuGee+lz3h
	fvYqleaLO0wYMJV4C+aJhAPMGYsO0Je+rkWwAwYPAnxa0QStsQPpgLHA0HRc5Qcd7igT
	45Xfbwsq6zzMesmYsuO7mtvNFfiZkix8xEDbzHcyOVegTz882YRvYEMT5XCeb3K0dzv8
	15HC2N0Y+n6SJtJCwBAIHnl6/8K3yZ8TG4bbo1JXApuCWrIJOCe0nHBDkT3XsXqzaSjI
	AtEQ==
X-Gm-Message-State: APt69E3XQPFlSjO7CEgz6HBU+IS+uhwGB0UQz4MMsFoYHQkP9LFtokRZ
	46Rk2AbqEilX56a02Udja35TV4aZZIk=
X-Google-Smtp-Source: AAOMgpcaY5g6/NDwQlC33QCOnuwaNLJfirxcithW/P6okNF7HuC4VQN7i57HwasBoWvgoGIGhiLqMQ==
X-Received: by 2002:a1c:cb8e:: with SMTP id
	b136-v6mr1928936wmg.112.1530280011644; 
	Fri, 29 Jun 2018 06:46:51 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	r15-v6sm8119573wro.21.2018.06.29.06.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 06:46:50 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Fri, 29 Jun 2018 15:38:29 +0200
Message-Id: <20180629133831.21377-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [sumo][PATCH 0/2] remove LICENSE_FLAGS for lame and mpg123
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
X-List-Received-Date: Fri, 29 Jun 2018 13:46:51 -0000

The patent for lame and mpg123 have expired, and the LICENSE_FLAGS
have been cleared in oe-core recently. Since sumo uses the same
version of the software, I thought it would be a good thing to clear
the LICENSE_FLAGS there too.

These 2 patches are cherry picked from master, applied on sumo.

Kai Kang (2):
  mpg123: remove LICENSE_FLAGS
  lame: remove LICENSE_FLAGS

 meta/recipes-multimedia/lame/lame_3.100.bb       | 6 ++----
 meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.17.1


