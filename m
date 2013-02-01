Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U1DKn-0001wq-Gn
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 10:55:05 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so1222995veb.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 01:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=fMq7wds5oYoJeQuL7fxlcpIj5T5X/gOQTSPa3OSjz40=;
	b=XCI2gNrDs8cXmV4sAYlYgwB5ntnlG4u+HaZ5cuJ3j+TPxHbLoIBJc0A3rHYIqpPuw1
	bq7GANMAjXoribo42PQ8GlkWvPQHgma5EMqio4+VvwwtEc5bZjkF7rhyfd0MBcCe/NpE
	PJ5XAnSJ6uUz9imorUaSCydiTez3jF3WndBBEdnT9xqU9oRbDo4UUB+RrzDsFirSjDhx
	OPK1A6pmZiI6+nSTPAgLzueSUpRYBGzy5F4FQxVo6JyFyb2ZmZMwWFKDNWbymUylvLQU
	Uw4d9U9wUtTKLJNHhxa33yGN3zuh1RhahYX0WVAwRVp4w+8QLTjcDgoT+zaCfuhBrHv9
	HXiQ==
MIME-Version: 1.0
X-Received: by 10.52.76.170 with SMTP id l10mr9459998vdw.83.1359711557439;
	Fri, 01 Feb 2013 01:39:17 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 1 Feb 2013 01:39:17 -0800 (PST)
In-Reply-To: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
Date: Fri, 1 Feb 2013 10:39:17 +0100
Message-ID: <CALbNGRR7skJWjq+hkTKTTBoJswH0-wFULRkJVPr6h5-nhfS=WA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 09:55:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 1, 2013 at 10:22 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> enable/disable support as relevant
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
What caused my sign-off - or is it a hint that meta-oe/meta-systemd
need alignment with this?

Andreas


