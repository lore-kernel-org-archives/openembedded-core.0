Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD4078448
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 07:36:07 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id z5-v6so473579ybo.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 00:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=4bHyLmNQxYfGTudXnj8Ip4dZ23xrbc7itjbYcDk6KN4=;
	b=sKfBK7hmCBy+0Rzo1XZ+TMqgHEwK1R2XXteJzPUkXDugTu9EETej4xpk7iZyvDM7jT
	Ys2LpW4Brt+nc5yWGDq9lVdNNxsIC5S/oyXjuZSMjQAq5wYVT8p1Ym9O9blG5xtme5+l
	DXQfaxts6HY189Y3D6zHTLwFcfstTR9BkmBbOAWsph+PcKBnkGss8jQXmaEm0F4h/+9B
	LPR28vUB2/Eo3HzZrtVRN+ngh0T+qbou24f+bdP4XsbWZhAdILcX/KT0WA8OusHCr2Nc
	n07fbks+pxj7bQDWMvZoA02AXl9JwGjK3wOvp3EIpc7mUZ+xBpRMMkViNX0kpOMBkdJM
	PVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=4bHyLmNQxYfGTudXnj8Ip4dZ23xrbc7itjbYcDk6KN4=;
	b=i7Jc13KKUu656cU7gs15kbwInDS3B9xSkDUrME/VhbxDk/irF/QHtIsdXKRjFBrG/o
	IjoXyxez1ukRMFEbHNsOI46ewL16Qr0SNBlv/5Y6No0vzQGG1itpMZ6JXRl9VIAZo9tg
	opIA1jAJLXo48lmSobY4rDnWzcDVkMuwFEkqWO47Si7VEC5UDHdemR03tAfxPReyQK70
	Z/D5rNsdaEqIXLUEULwT0QNXSDww50gbNIWyhmHj4ptBK1lLbZAD2SOa9nZaL22jBq9u
	cYuDBtnxwLopmyZlFCbUgpL9y9BItNdW7883H3GeOYplB4XhqcgDOlVgbpc/j93uHzlJ
	yiOg==
X-Gm-Message-State: AElRT7H+zmzZeU/OepbOb0kkgZMR/bu1/qZzu8Sh//rsE5jL5DA8iiuw
	xz9aanKA2HkOtD8xc8fiZB2yy8MmxGjuKPAloLqyrQ==
X-Google-Smtp-Source: AIpwx49FdbFMOcSDd+Aln8f5QmdeE8PbKHLgboRm3HmdYJle3bwnI7cXsj/Jc8MhsZfid4cU2eTHy5PdZZElpE+o96A=
X-Received: by 2002:a25:d0c6:: with SMTP id
	h189-v6mr1440773ybg.185.1522222568410; 
	Wed, 28 Mar 2018 00:36:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Wed, 28 Mar 2018 00:36:07
	-0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 28 Mar 2018 09:36:07 +0200
Message-ID: <CALbNGRR4soKMjaVocA8_VxZocOvt=gPLVDSYaet10paKAY4wbA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: On target postinst broken for opkg
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
X-List-Received-Date: Wed, 28 Mar 2018 07:36:07 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Images build with current masters show in postinstall.log:

| dpkg: error: failed to open package info file '/var/lib/dpkg/status'
for reading: No such file or directory

There are two oddities related:
* The status file is there but in /var/lib/opkg/status
* There is a folder /var/lib/dpkg/ containing empty folders

Looks there is some opkg/dpkg mismatch but I couldn't find the culprit
yet so I am asking here for support. I bet it is a copy&paste issue..

Thanks in advance

Andreas

