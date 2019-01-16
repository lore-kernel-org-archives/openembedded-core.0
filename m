Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com
	[209.85.161.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2895A7C121
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:27 +0000 (UTC)
Received: by mail-yw1-f45.google.com with SMTP id d190so2387598ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=myHJGsM8RPJV43DAdS++MOqGgAnq14m5k1GEvxR7eg0=;
	b=iOrw3fP2VVBRL1aM1U9ypwaGgPuFbn7Tg0QeviFNJj/NX27hDmAfZFrtke42q8c4qD
	XJ4LZSrPuuJ8qUevubPyV9LViw9xgAgWdKebc1Mo+CqbZA/MxEXqq7ZYi/9eG5Lg5ES7
	zAEIZS7bpd40MgWw7eLoQ30QT3NcSJY5F+8POOttkz/IoCRua6llGj2ngsbuiz0vzcV1
	ARtXsdgAhQ+kD/bVpnBVgazAFXKh0b3T+KlCNdGKywwQ98Q33yomzdNawY1OgZzr1INM
	/KQJH7c2YthdvAzgE421mHGyz47SO7WrsImoqmD4ZrkZmfF9QgzKc2XCifxHEu8kpuRC
	wUQw==
X-Gm-Message-State: AJcUukd3UE//Zi5Qyl5Pur7+xuX9qTuc9er/RydJzOUpFhBCqXcshMSw
	fm5X88k/3nPnOrk7/OD8KkH8dp5U
X-Google-Smtp-Source: ALg8bN5Ue1P2rypSsD0tHgoIZGlKpZ8A5cHMZor4WT0ENuqzSbNfW6pTOv97KqJkMvQVe+gkhsZwEw==
X-Received: by 2002:a81:3454:: with SMTP id b81mr7398079ywa.191.1547643087975; 
	Wed, 16 Jan 2019 04:51:27 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:27 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:09 +0000
Message-Id: <20190116125124.20177-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 00/12] util-linux: one package per binary
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v4:
* update patch 06/15
  * unconditionally assign PACKAGE_PREPROCESS_FUNCS
* update patch 07/15
  * introduce update_files() helper function

Cheers,
Andre'



