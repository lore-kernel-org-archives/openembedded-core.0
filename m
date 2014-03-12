Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC566B58B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:38:03 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so11152756qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ximuhi8ysBd/wsHYsYo7CdPwJkUrKl0yNN1PdcGz09k=;
	b=DhJUhmEdLFV8nKGT1Uc7BVZ3WyYmHeu+VCXG8Vnz7+9Mfwx7XwyrIPmx+FUsl66go0
	UfpqMri5xDpiauwg46TjBX1Uonp5zXlePD1rZf2NAjMMqRY61VcpsW/eWAoVqM9EkvPA
	SNTf6ocSKgTE5gTW9Fd6GNxVkPeKo5xt+1Om3a/ydEI7DEna31kiv4WX8srONyQvXdje
	USWYDeZ8J9e9n+zrUrPGJxCRgiHbd28J/4w5Zc3+sTbMx5mNBhURw6iPExxnj8QGSzq+
	YiYkmyCal5fGro2kbDow3LJqSRLeRpUkjHrKB+0dooXIg0jEfcWxUcrzdzKYFFyInXi6
	SDjA==
X-Gm-Message-State: ALoCoQmZo9ooc7MgozmnYhdXsNsh49I82KoKPPrRCG/g0l/wpUcp3nzJ6CSLn9QpgmvIPyZ112IK
X-Received: by 10.140.106.195 with SMTP id e61mr44346464qgf.66.1394638684795; 
	Wed, 12 Mar 2014 08:38:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Mar 2014 08:37:44 -0700 (PDT)
In-Reply-To: <1394627248-13097-6-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
	<1394627248-13097-6-git-send-email-alexandrux.palalau@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 15:37:44 +0000
Message-ID: <CAJTo0LYd_--2XzBsDA4d3vRRyqTGFbdi_-c3J84hWY9H8tog2Q@mail.gmail.com>
To: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/6] gnome-doc-utils: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 15:38:07 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2014 12:27, Alexandru Palalau
<alexandrux.palalau@linux.intel.com> wrote:
> +inherit gnomebase gettext python-dir pythonnative autotools-brokensep gtk-icon-cache mime

I can't see any reason for gtk-icon-cache and mime to be inherited.

Ross

