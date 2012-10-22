Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TQKR8-0004Ym-Kc
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 18:01:06 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so1639101lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=2x9wnKaPsCkdIOY1x8hD+lhT7yQAfhVOPnx5ztzcDAo=;
	b=YKM8sScKWsgfaB5EU+wVUJucatyE9/KoM7jyajWIOTJ0vo2g8wIYs5W/y04IAAoR0Y
	QWSC6o/rSFf7k2G9xAc0EmNgDTzTUIucFeTVHwsmLK5ntSW2dpFc3d4trg/Ia9X49UyC
	ozPPAGVkWdFHS3TiN7E5mXGkNrlNT/Y37+RAx4QV8s+UPovwxWRS9ov1SoHZAoR+Z3KC
	c9n+h577L2dtWuM2r8jfzKdrjKG84VNiZNG5+UucPt6iJWaO/yYwVrOwZ8SEY3sLDLWd
	u8HsI2zAmpw6kdUwPgx2tdMc0Ntyp9SgiI29AQ5IbWBuEbbEINyrwqUJoauFL0zP6e7U
	47DQ==
Received: by 10.112.24.6 with SMTP id q6mr3948747lbf.24.1350920861810; Mon, 22
	Oct 2012 08:47:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Mon, 22 Oct 2012 08:47:21 -0700 (PDT)
In-Reply-To: <1350919506-4517-1-git-send-email-kergoth@gmail.com>
References: <1350919506-4517-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 22 Oct 2012 08:47:21 -0700
X-Google-Sender-Auth: bvYrIOZgEWVNd7F5YJwiWGzuCMY
Message-ID: <CABcZAN=UswycOnUjMpNKju4grJ1esYRLg==to0BvEavW-T-yWQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH][for-danny] lttng-2.0: fix srcrev/pv to match the recipe filenames
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
X-List-Received-Date: Mon, 22 Oct 2012 16:01:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 22, 2012 at 8:25 AM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> Somehow the recipe names got bumped, but the SRCREV and PVs in the recipes
> didn't get updated, so they were still building old versions.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>

Ignore this one, use the second that got sent 5 minutes later.


