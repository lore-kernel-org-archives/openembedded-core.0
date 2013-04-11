Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQH0l-00015t-9L
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 14:53:55 +0200
Received: by mail-ve0-f173.google.com with SMTP id cy12so1376019veb.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 05:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=qYh8eFkpRErsCFPkySxQJci9eebXo7nMI5sRiWzG/wk=;
	b=ZqNPoKide5Z/vYnG8z76xVHybRpTEL4ojXjuuX+HPvirHnoULtC7lBUJ8TB4Tl64qa
	DduQ1r7AWJxh+qLvJCPVWbVTbDtRml6BMHlEDW8UjrIlZKwLUPasVxgx6MLZoTasgeCM
	LNhC43+Gp7po7lwP6esKT26oEv3FhXW5mS7sqsNNeOIVoCfNqmQrUv3FBuzD3pvuVYzD
	4X8VLsI1MLyO1b9tb+BH9mmq+nbSL0VpZdOLTj49rsBvNKB8iK23WYXwjSssavq/V59E
	VZ82fEsP4AEl+P0rI6HIHIBlU+OZ5ZWRI1vz7w6ASv1nMMGu8cI6Cu6PTrZ0FXF54Ral
	Ljgg==
X-Received: by 10.220.119.200 with SMTP id a8mr4808354vcr.38.1365683791906;
	Thu, 11 Apr 2013 05:36:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 11 Apr 2013 05:36:11 -0700 (PDT)
In-Reply-To: <1365681363-29778-1-git-send-email-erik.boto@pelagicore.com>
References: <1365681363-29778-1-git-send-email-erik.boto@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Apr 2013 13:36:11 +0100
Message-ID: <CAJTo0Lb2uQcErVk5aZpUQPPu81gXX+9MM7rcUHTAXs-CZfimCw@mail.gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
X-Gm-Message-State: ALoCoQkIAQyG/BOPlSZcG5FDd1qc0/1qEV+enQKSUGtq+XYrQvxLw7w/yGzhHTm6aUAnGe3Wftg9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Fix path to systemd-analyze so it end up in the right package.
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
X-List-Received-Date: Thu, 11 Apr 2013 12:53:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 April 2013 12:56, Erik Bot=C3=B6 <erik.boto@pelagicore.com> wrote:
> Since the upgrade to version 199 the location for systemd-analyze has cha=
nge
> this caused the systemd-analyze package to be empty and the binary was
> shipped with the systemd package instead.
>
> Signed-off-by: Erik Bot=C3=B6 <erik.boto@pelagicore.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Richard, can we get this into dylan please.

Ross


