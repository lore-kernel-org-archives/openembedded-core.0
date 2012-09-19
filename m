Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TEMCj-0006QE-Gv
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:28:45 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Sep 2012 08:16:02 -0700
Received: by obblz20 with SMTP id lz20so1189901obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 08:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/C4o4X9goBvDmEF1rZzNTFVadrUBiCFyVpJ9wpgwjwM=;
	b=dAcbqYHXo/vOowRZ7notEsCQkvfu7iwP8syGAvA0ZGFg6QlpbXy5/Xezv0o9hadFn7
	dHuBqCYNXMLgXxdKFIGuwfiIZZTCbQIkgG6biSkmR4cZA65qc51QnYNcuDir3g5Cg6xO
	H/Ct3WMeljaqN7EpRpV340eB4a0Z+krgztZ9y4q+0/d8EzZz4b6K1XavxfIgj6ylh1qy
	5Ekvr612/2AjujEKLWqpYVfSFf1sMxAdEZeCHpS9CTFMG2I3aVWZaAIOo71tTclEuzaj
	9Lcf3oMBJQ/AQ5IGCOGCms/9AC2fCiYGDr8ejESefIzrUhdGaJpuBtQZQ8FAJbyfdpPs
	GLjw==
Received: by 10.60.171.174 with SMTP id av14mr3315336oec.61.1348067757837;
	Wed, 19 Sep 2012 08:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 19 Sep 2012 08:15:37 -0700 (PDT)
In-Reply-To: <5059E042.3050805@linux.intel.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
	<CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
	<5059C2CE.4050109@intel.com> <5059E042.3050805@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 16:15:37 +0100
Message-ID: <CAJTo0LaB862PyJ8VGCJgLVCqb9A0=AZf43fztWjQOPMUuki-5Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQn63xg06oSB1grpsxLBeLFPOqk1oee+zFaHbSM5W4YhtmCOG/VdGHz04ZT4O58LqZxHTO1s
Cc: Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Wed, 19 Sep 2012 15:28:45 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2012 16:09, Saul Wold <sgw@linux.intel.com> wrote:
> The question here is why do we need the gettext-dev package for intltool?
> What does intltool need from the -dev package?

intltool needs the gettext binaries and IIRC a header - but I'm
sufficiently unsure about the details that someone should verify what
the dependencies were for documenting in the commit.

Ross


