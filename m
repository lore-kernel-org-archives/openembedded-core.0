Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrVBj-0005vH-KF
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:25:15 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 07:13:53 -0700
Received: by qcmv28 with SMTP id v28so867184qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=djJjLnkB1hC+NTb2geFdgZEue9e5LU7OCLn6IcK4rpw=;
	b=b/Ksxx3Mu8fX0Q8zYchq0/Vih0vXUUMGhNv7LtE/EkvftfjFQ0GZW/wpHPtCS3ZWK0
	VpMOiWWqs2hoa8u2qPwnTfA9vccvwv1J5yHF3Jztcmt2prSIdyW+Lat3oxMMfp8h4ZvS
	BDDs2uZB7pFYBfETpvE+IVD1jXsec7KPEbuEjPRuVn9EBQnLkCEJBBoEWqO5IGhjIY3c
	YR8IrW68VH41A3tvgKw+oaeybm0IcSZyViUs0gMgq06XkXdE3ETu8UlniwI/kw2LrAZo
	ZChf43PIzecVehq/ahx7O7q4KfQ0jU8Vk18pUobym06+NUjz31QJgieDguITIxWWYIg5
	vYfQ==
Received: by 10.224.185.148 with SMTP id co20mr6352905qab.4.1342620832548;
	Wed, 18 Jul 2012 07:13:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 07:13:32 -0700 (PDT)
In-Reply-To: <20120718134507.GP22569@jama.jama.net>
References: <1342618950-1081-1-git-send-email-ross.burton@intel.com>
	<20120718134507.GP22569@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 15:13:32 +0100
Message-ID: <CAJTo0LaUN-DpRo2xKuUOM1ujLu6C-fc-6WZmxGyOjj4O8C2qsQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQndiloT/byHzh1FqkAFXSYZVh+3Jkp+qvCDtHdTpgiuHsPvRq637w0haDpguV1MBIYcNY94
Subject: Re: [PATCH] sanity: display the parsed PATH when complaining about CWD elements
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
X-List-Received-Date: Wed, 18 Jul 2012 14:25:15 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2012 14:45, Martin Jansa <martin.jansa@gmail.com> wrote:
> Maybe the same should be added to BBPATH test bellow?

Yes, good point, I didn't notice that.  V2 sent.

Ross


