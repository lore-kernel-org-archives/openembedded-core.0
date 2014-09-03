Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 690DA713B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 14:59:02 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id i17so8640044qcy.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 07:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OxTzFEUtD+J5m03L8mhAPK+1fmHHUqzCbwRG6rXRc0Q=;
	b=IHbgMvZE1XEhXLyQ48/nrcSXWY86L8tIVcPi2DG296QF3fiNbW8JfmR0q0lz7rAn+J
	I/Yaq2F7KSRW0emC/AjSMwx5K7F/8w7FEI3lThBrxg5eQmQ/fx3UVD7C68JJDvNErpQq
	ZU6O0WA2eHRhQOTZzZ13gTP/k99xGPS2IAXoWf6extN05d0dMgNNrhwpEDW34SO1xEmm
	81m4jcNDAsL0tiZ4RXCEgVssrfAE/8QXusRUYbF/Pufg3xZqLco3JbygBTDHeWH/CWcj
	FZ2PxMuNUoHnwhrC5XXEOCtrxEyMvJ+hsMIL9bp5MMxgVowxfotkbq7DFglC7mnmhmia
	a+dQ==
X-Gm-Message-State: ALoCoQmC3AfPiqv+Ko6RrN8PKXcLbyDBp80w6RfmXWtxMe1ULlM4oqW+COsN4Kopywy3mvoccuLI
X-Received: by 10.229.219.138 with SMTP id hu10mr66625111qcb.5.1409756344009; 
	Wed, 03 Sep 2014 07:59:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 3 Sep 2014 07:58:43 -0700 (PDT)
In-Reply-To: <1409663439-1725-1-git-send-email-georgex.l.musat@intel.com>
References: <1409663439-1725-1-git-send-email-georgex.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Sep 2014 15:58:43 +0100
Message-ID: <CAJTo0Lbmrc5w2WfzMFkjNW4xHbAfjmbeeUZJwmThDXdN=iNVgA@mail.gmail.com>
To: Lucian Musat <georgex.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oeqa/utils/logparser.py: results based log parser utility
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
X-List-Received-Date: Wed, 03 Sep 2014 14:59:10 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 14:10, Lucian Musat <georgex.l.musat@intel.com> wrote:
> +sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'meta/lib')))
> +import oeqa.utils.ftools as ftools

Doesn't that add .../poky/meta/lib/oeqa/meta/lib to the search path,
which doesn't make any sense.  You shouldn't need to mess with the
path to import a sibling module.

Ross

