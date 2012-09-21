Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFBJd-0004i2-E5
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:03:17 +0200
Received: by eeit10 with SMTP id t10so596131eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eidQ073v2IA3bjUgZ+BzaYauDYi779xM7tTsQg3jb/M=;
	b=M0j5DGnUDB8BzbU6sAqvIi74ART2jK8gFab0gbuc3vNkZ9/YhEfTGDzns66m7CU6a/
	MZm45LweUdNSzZ3fXq4lvCB7gzp0dnL3WLOjXiMB2LPg3PtLAWJnKvP+XxNHDt4dI/w7
	0ojcOAlmQhdBi1yu16skIRrAZShleRRVTd7ixJ9IONzWDkvXdJvY1KGl+NWtRsukeZBt
	fi3zNSfWYpNTRCk4o6klW3EtSWj/dNJBbNGL8fT9D+daPMwgB0ms6vRT7UCFljveeWHf
	zruBne35D51zYMmHichUOCBKCb4IxdpXLqlGO3eOhquxVXrzupf6GOYzUdmve6aFad2N
	6ZxA==
Received: by 10.14.173.131 with SMTP id v3mr7806327eel.15.1348264233097; Fri,
	21 Sep 2012 14:50:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Fri, 21 Sep 2012 14:50:02 -0700 (PDT)
In-Reply-To: <1348261041-6370-1-git-send-email-sgw@linux.intel.com>
References: <1348261041-6370-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Sep 2012 14:50:02 -0700
Message-ID: <CAMKF1son2joom2S252ZqF1Cu3SWs1ZLzceNjez5LTEM8ANmd4Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] udev: upgrade to 182
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
X-List-Received-Date: Fri, 21 Sep 2012 22:03:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 21, 2012 at 1:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>         meta/recipes-core/udev/udev_164.bb
>
> sgw - Fixed up DEPENDS += and added some OECONF options that where in the
> meta-oe version and make sense to be included.

yes it certainly is of interest to have all meta-oe recipe features so
we can consider it as migrated into oe-core
and remove the recipe from meta-oe


