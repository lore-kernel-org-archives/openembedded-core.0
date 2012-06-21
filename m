Received: from mail-yw0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1Shr4I-0001qu-BP; Fri, 22 Jun 2012 01:45:42 +0200
Received: by yhjj63 with SMTP id j63so1443266yhj.9
	for <multiple recipients>; Thu, 21 Jun 2012 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=T1ozfN2L5Pi/VCwU2GzXZk+FZJcwZtxMSozx6sUFovU=;
	b=jUne3O4JYPmvoFvQsvBlimhSGnghVsI3eMC0XwT5GrcBAmxmZdOkSlVz7TeGqSHUoO
	bFOrvt8soY08X7XZ9+GTRO1+wb6Z89t4JwxN6mb0XDmyPg3gFwEsly/m66ez9qaGAow3
	k1lqi8YTq1cc3PWt92iVA+mgM+Hn4ee/oX9EEjXz/rmzDw7nwV5EWLBS1eQaV6I6lAGr
	s7cY0/N+CDDFFuBlkaLFNTzlkTg1WntVSfzqu6xRIe1dBdzp/9atBECBDp9fgTJpy3M9
	PJlGy+L/IEJ0Mn31jtvHnj6z0UK2uA4PduFgVIK5vAU5a4ZneHlfe5ec9iuULxULlz2i
	yEQQ==
MIME-Version: 1.0
Received: by 10.50.207.3 with SMTP id ls3mr165824igc.0.1340321694806; Thu, 21
	Jun 2012 16:34:54 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 21 Jun 2012 16:34:54 -0700 (PDT)
In-Reply-To: <20120621230216.GD30753@denix.org>
References: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
	<20120621230216.GD30753@denix.org>
Date: Fri, 22 Jun 2012 01:34:54 +0200
Message-ID: <CALbNGRQ5CBSDS8zPnkem59mOjzAGDy8FHZifU_g5f9z59yOybg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-ti] massive fallout after updates / was (no subject)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 23:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 22, 2012 at 1:02 AM, Denys Dmytriyenko <denis@denix.org> wrote:
No need to understand everything: By removing require linux-tools.inc
(the fastest patch I ever had :) I can now build again.

@layer maintainers: removing

require linux-tools.inc

should be taken into consideration

Andreas


