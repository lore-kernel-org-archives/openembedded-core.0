Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TG85o-0001s3-Ow
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:48:57 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 05:36:05 -0700
Received: by oagn9 with SMTP id n9so5394555oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 05:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=14rG9sO2WJRhADX6lmVWGnDYusM52mvtaiVeBI7uRNw=;
	b=RmMM4ip1DMN6CejAmGhN+T1W+mdRfPFEHgf1c37zzUj689EyCXMiWyyqg/5qJ8/FWC
	X4EJWLrbsmyY1BHyF3JD5GN9y2FFis3SwDRgQev1tYsYhKJi/dlk0MNlB62aNyoEwjNp
	VHvtks27pUSjwhUJ3LUaXsOBQttDaW4rTTXPiV5U3i5GvFhJJDIN3MrBn6VXfYjtIob4
	Nb3z7rrMWGG9P0eiwgcwiQdawZcqBChrGkIhu6/Xy9QUgueU7RMd+IpPB93qPq7AaoIM
	dRLYy7WkxCGCKjbb+lYUyRysQj/SrTmydktsoODX1e9P6Mc54ZzN4BnR1/LoZfvEGL1q
	EKPg==
Received: by 10.60.12.106 with SMTP id x10mr9448433oeb.103.1348490164706; Mon,
	24 Sep 2012 05:36:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 24 Sep 2012 05:35:44 -0700 (PDT)
In-Reply-To: <1348489853-5239-1-git-send-email-ross.burton@intel.com>
References: <1348489853-5239-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Sep 2012 13:35:44 +0100
Message-ID: <CAJTo0LZ5ozwS90DWohYL5SseMefgKc94YQvzVnNTfptMN0NTCw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQm4JqbiM9FYIMjAqiE0gC3f4DSsiJVA/hl+dmUoTOscpD9z556FsK0reffEhD3LfLzjvNxX
Subject: Re: [PATCH] xserver-xorg: upgrade to 1.11.4
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
X-List-Received-Date: Mon, 24 Sep 2012 12:48:57 -0000
Content-Type: text/plain; charset=UTF-8

Ignore this for now, it's causing the keyboard driver to explicitly
depend on things it shouldn't be.

Ross


