Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Txg36-0002OD-1l
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 16:46:15 +0100
Received: from mail-qa0-f71.google.com ([209.85.216.71])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 22 Jan 2013 07:30:36 -0800
Received: by mail-qa0-f71.google.com with SMTP id i20so14009442qad.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 07:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=I3nhGtwITusX64cI8MCIs7xwvPIPFLL/OwNwaPJo/wM=;
	b=eYKi3zDJ4R2rBAyAhlMkvWh3mCLmUlKudY3sT60YxoFkPVAiIe+YMnkt2HwlaEP9Jd
	t0UMgBRc6hBsEpREsaFloYS+D7rA/GMxAkbLr+YvkJouyM4dLaP3NePNEQesLglQ65zC
	Lg2xFgkMfsTk6nDSWIMhW4QOUtiA1nnHGxeW+g4dL1Q9HJsYcbKUdHwug+nD5nY5NYCs
	7QTRrY8U0ugPZtI7SMOV4b0KxJkW8RMBt8btN+nUmntyq3D+Bw47nig4DGDNcojLh9kM
	QDBzyvvYOHxluPCBS7Gz0LOcwvByMEpwvvoYLKXGkcGdhPhVmzbma6eVyqKAEp+GUPZw
	Vj2A==
X-Received: by 10.220.115.133 with SMTP id i5mr23616251vcq.42.1358868634859;
	Tue, 22 Jan 2013 07:30:34 -0800 (PST)
X-Received: by 10.220.115.133 with SMTP id i5mr23616242vcq.42.1358868634797;
	Tue, 22 Jan 2013 07:30:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Tue, 22 Jan 2013 07:30:13 -0800 (PST)
In-Reply-To: <cover.1358763271.git.kai.kang@windriver.com>
References: <cover.1358763271.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Jan 2013 15:30:13 +0000
Message-ID: <CAJTo0LZhpvRd7oR6n7gVbP1n6=YuqqT_CHoa6ozs8WiK7w3KWQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQl5ihZW004Kf1jgTcX0Xt6TwNp6WRucp2nnYR4uoLM+fltoUqvocnhJlJkitTqaXb+BJVcLEYgcz5vV1wHUKFS806kgaN8XS1F5ZkyEkh7b4bPls1ThvHzznnEWTSAwB9I15gToV/x7P7hhX8h1ZNALG5KJ8CA5z2PaUC/nEaim/Pt0SIACTFy3KEolzZ0+hin29ffP
Cc: scott.a.garman@intel.com, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Upgrade perl to 5.14.3
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
X-List-Received-Date: Tue, 22 Jan 2013 15:46:15 -0000
Content-Type: text/plain; charset=UTF-8

On 22 January 2013 02:14, Kang Kai <kai.kang@windriver.com> wrote:
> Kang Kai (2):
>   perl-native: update to 5.14.3:
>   perl: update to 5.14.3

Does this need to happen in Danny too? (although that would have to be
a patch and not a version upgrade)

Ross


