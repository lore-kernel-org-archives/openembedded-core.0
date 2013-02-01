Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1HQB-0004hT-LZ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:16:51 +0100
Received: from mail-vc0-f200.google.com ([209.85.220.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 06:01:05 -0800
Received: by mail-vc0-f200.google.com with SMTP id p1so5435318vcq.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 06:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=nCk7bwj/hPPqkeZtgFr03IM6hFCc6VdpeaYTms2TYeA=;
	b=TXjA7zQDCRKE8Bk1NsAcbO6pC5AjMNnTqUOfSb8hMaiVWIDHmQHaUePf9qj4IuOZTA
	a/ybwKTWcocoqaEjF+xBztFH8gN5T9jfW928meTOgvXgW1o5r/bwiQr5qIkXBPX93B+p
	cgij69wM/hdam3Ng6dF6SwlTERwfp6uXTBkuB1VcWSDHcawAEJAud5XcjLeOLAMW1mOB
	JmDyEUAgw+IWI4xZvkGYkB1hUSkIdo/qQ5KAIgoralxaCrzMNu+O1kOLu29HVmSgq2Nd
	wJLHITxRSqpQ3aSvYEnxW4njajygyqCKxGvaRfvWv/nd7VO+XNAOWmeNuid/2Zlv9kJs
	McNA==
X-Received: by 10.52.90.243 with SMTP id bz19mr5677400vdb.112.1359727264071;
	Fri, 01 Feb 2013 06:01:04 -0800 (PST)
X-Received: by 10.52.90.243 with SMTP id bz19mr5677393vdb.112.1359727263961;
	Fri, 01 Feb 2013 06:01:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 06:00:43 -0800 (PST)
In-Reply-To: <510BBC3D.1030207@topic.nl>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 14:00:43 +0000
Message-ID: <CAJTo0Lbrvo2J-qk_WU=_0gTqJE7d-_vxJsWxAa6fDSv7yab6iw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQkUqRZW93JI+UKcpdGLHeICZXUjze9DEiW0eCTq5gyg3F32rpO1MCCOvSclO2/bcBm2mI1xhev9W3i9G0f4K8B5+sidvUGCQvD4bN/nknZLWj68+0wq4ExDI6cAYiW+PNW9S0UcOViDY4iqircofAgse1FcLzzp+RJJH4HUxTB44a1gb0+DzaMmVN0k16uYAgdxD4gt
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple MACHINE building is broken in OE-core?
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
X-List-Received-Date: Fri, 01 Feb 2013 14:16:52 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 12:59, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> How can I get a list of packages/tasks? They just flash by on screen, but I
> bet there's a convenient flag that I can pass to bitbake to get what I want.

There's a log in tmp/logs/cooker/, or just redirect bitbake into a file.

Ross


