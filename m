Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THcDK-0001jd-Ll
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:10:50 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2012 07:57:56 -0700
Received: by oagh1 with SMTP id h1so2634302oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=afGzSZaIYls2wgLcv71A/Rm+O20WA8Qx81iKKxku5TM=;
	b=eMU9EbQxtimd/C3HBiJ7leALPvEs6tKSnhAz/aROSumJUj8yWobGtZewj08o/zbhFr
	wf2mmgH6I2ziDSOP0FaGWi1ggT03NrrE+s5FbYZCjhjMUlPinvBxua4OPD73MYwwD3MC
	2qG6dilArBL83IUfZEobiBSeTwLxVuuCFRqdVAuNPGKZEVnBUPFlMapLiP7ziAdmkoWK
	BcciSRGzQu/6ADlrrRwPWViYRQ4Dac9aSrLDc1ne5Cd40LswmoMHdv5sQfKzAjwh0kQO
	T/uR7WmB2WXcpwKN+uI+IL/8FoiDRPLSyRqIq5jt28yuiJb8SpyuFuQaCALiBBmNA57S
	004Q==
Received: by 10.182.154.70 with SMTP id vm6mr6176927obb.50.1348844275033; Fri,
	28 Sep 2012 07:57:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 28 Sep 2012 07:57:34 -0700 (PDT)
In-Reply-To: <CAJTo0LYnnA868v3Dd5yDWn9wpXS3QsHLt0P8Ejj0BZiGmwd-RQ@mail.gmail.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-10-git-send-email-msm@freescale.com>
	<CAJTo0LYnnA868v3Dd5yDWn9wpXS3QsHLt0P8Ejj0BZiGmwd-RQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Sep 2012 15:57:34 +0100
Message-ID: <CAJTo0LYJJpXC_zAC0R5A+mfGAgxUGsXXxB-=U_EVTxOVenUFXg@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
X-Gm-Message-State: ALoCoQmEetYypjE2eH+MU03ADJLih1jWqkcWSRu83wfeHmJArawo3NQkFzEyJt77GCzB0NC1YzPf
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 10/10] libx11.inc: fix build issues for older CentOS distros
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
X-List-Received-Date: Fri, 28 Sep 2012 15:10:50 -0000
Content-Type: text/plain; charset=UTF-8

FWIW, I've just filed #55423 and #55424 upstream for these issues.

Ross


