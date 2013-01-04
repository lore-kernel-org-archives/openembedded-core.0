Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tr5Ih-0003iI-3k
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 12:19:13 +0100
Received: from mail-yh0-f72.google.com ([209.85.213.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Jan 2013 03:03:52 -0800
Received: by mail-yh0-f72.google.com with SMTP id q46so25241211yhf.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 03:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dhxYiZDX9qIQbgbpEHetEeT/WO2RriipQDCPwD12IJA=;
	b=kgfdzLAvn3yESztX3If7KsELhrzpeOqXfk+qDTjick/y7zTxKZ9cdRD8eEnJJisnRH
	YQ5USv4YuwZI7OTL48JHG4v+Lkb5s7x/18qBftHKBzFdP+K1hFhRlbHrP8Gz/ck7ETsI
	XYm3NKOfS9CYGEw7/ZIYCQObtI4jGOJXOhyBXRyJx9IDRwyaddGo3c6o65wmwmRY9Wat
	lRwqG+Yuh68nIR2Z5HjaYa/wZq9Mmms5QY5squdwc9m1E3wqRZjcH8stY+RSfWVNYM1/
	S+iiomZZ0txh54/bcNPaC4Nikh5793c08K47sQYyUin5/2VH7J4WmGdy9nj6kAMeCckS
	m4eg==
X-Received: by 10.220.240.141 with SMTP id la13mr75299405vcb.39.1357297431216; 
	Fri, 04 Jan 2013 03:03:51 -0800 (PST)
Received: by 10.220.240.141 with SMTP id la13mr75299401vcb.39.1357297431130;
	Fri, 04 Jan 2013 03:03:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Fri, 4 Jan 2013 03:03:31 -0800 (PST)
In-Reply-To: <43f5ecf2bec840e1266c74982aaa847e11b09007.1356342794.git.alexandru.damian@intel.com>
References: <cover.1356342794.git.alexandru.damian@intel.com>
	<43f5ecf2bec840e1266c74982aaa847e11b09007.1356342794.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jan 2013 11:03:31 +0000
Message-ID: <CAJTo0Lamd_OO5gYF6MvPndNQFH73_P-d0EgBJvTzLkqXkwXX1A@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQmur8aZfnphcS72ngLC1Lo4758NgdmEbGjbBkCEjkaBVwHOVx3yUHt0FtTfFT8DsOr7lQ4lrvU0qqpnQZ1l7C6GNy0L78AKwADiC8FhFXYexX0S1kRrH7tJ7T/lGz+ygZKVuEB28KEQVCjV6t4Rsg5FH/U2m+VuJWEj8C7swCQ03RFsiBaFGzltixgJVmZN6BGmrg5P
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Fri, 04 Jan 2013 11:19:16 -0000
Content-Type: text/plain; charset=UTF-8

On 24 December 2012 09:57, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch enables mesa-git to build wayland-compatible
> packages for usage with weston.
>
> It adds wayland platform support, packs the wayland-egl
> files.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


