Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm1kQ-0001h8-8k
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:30:46 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 04:15:55 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so6402888vbb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=sYs0oyTD2u661uzIYUv7cqZNAEAT3xcJV1Rq4GGtjTo=;
	b=KlWKWcLrBdc5yMsDufMSjo+WS7bPZt2cAQvS0nZ0fgfSc+fEvgUSsnOH8QJb4C3+bo
	d60PRc8eb6VPYvIoCTJTK3R+O/A2xa+sDwq/3yXEwWPEOtOs99ekjcWmS8AqvgbuiTFZ
	kue8aIuoTChI0abncsWu8GIcLu9Gfawgf6OjF+97KhvvvD8IQxQFVj5eS3p/09dosKi1
	i1OftmWZfFdcLaGQVDDTa9C7kLBLgOd+CGbViXAxUl6qtmxsts/gEk8bZNEbcCJbfhBj
	RNpYz/wIct911fU8gRLUWSbFllaxY4nw92OLomK3q/lZt29ml+rZdFkcKwr1LaEjbo74
	ORHw==
X-Received: by 10.52.37.9 with SMTP id u9mr17102553vdj.83.1356092154459;
	Fri, 21 Dec 2012 04:15:54 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr17102548vdj.83.1356092154388; Fri, 21
	Dec 2012 04:15:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 04:15:34 -0800 (PST)
In-Reply-To: <50D42D58.4010703@intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D38B3E.30003@linux.intel.com> <50D42D58.4010703@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 12:15:34 +0000
Message-ID: <CAJTo0Lb0AyeZwC6R4M+YjzGxm21d4Q-goSMQ1x0EMAFvCtO6iA@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQnbjhwikZFXV5x3XQuEliByCPQ0N6KfdVwpTnbd/Zmj+2s+dbcsDTNLP7/bvdMaAkZpJ0kwtPdXUH4qLCJwrTaUe0szpJUz7VeqfHdm3sVkVFeqIRigK759XMzXWxDjgOpVX2XkVql4o0ddW+LBxCMB82kGaVoskZbwSX05L3wAvdyw4jNLlIS1AVIaN14IkEfnNOFl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Fri, 21 Dec 2012 12:30:46 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 09:35, Radu Moisan <radu.moisan@intel.com> wrote:
> Wouldn't it be harder to review? I can do it anytime, if you think it is the
> right way to go.

It's much harder to review a patch which has corrections later.

Ross


