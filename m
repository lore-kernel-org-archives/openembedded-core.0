Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 18EA16C99C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:44:42 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n2so2461286oag.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Nx8llfS/J6SFvXaKznFTmFZNuxa4IxHdFkHy4i90YSo=;
	b=VJsu8vXTB7HXj4iGGlslo+G+lhZdhfzrfp5UFl7cF++eMjWo/xPDWgnn8a80/GEMQF
	v1wWC/L/OccLyBvRpoHmQ8bVHlnMANIyBeofxKESUVbI+SeB94PqWdnRqwGFCh43co0S
	cW7S3Kg+JN7WH9g3NZXLgBbx6ruMmcLf/4n9mbElC9GtRWwo0T9/vQofre+wGgDwPeHp
	VzyRgwVZ/TSZX2VimjqaWbntbezgYkkL1ugZkCI3M2BSvvtFDyDHHps1CCZL8bhMwqMM
	byz5FTd2c6a9M8MUzQCYx8EzeqHGwjEha5LrgTfT98D5qbSg4E/egChPDwvN9DggN2XQ
	7VUg==
MIME-Version: 1.0
X-Received: by 10.60.133.71 with SMTP id pa7mr2678553oeb.44.1380041083560;
	Tue, 24 Sep 2013 09:44:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 24 Sep 2013 09:44:43 -0700 (PDT)
In-Reply-To: <3145da4c2b158fd0e2684b66cd68dd769a1c94de.1380040307.git.alexandru.damian@intel.com>
References: <cover.1380040307.git.alexandru.damian@intel.com>
	<c05def412d4cd60198d038ad9c20c90e94dcbca7.1380040307.git.alexandru.damian@intel.com>
	<3145da4c2b158fd0e2684b66cd68dd769a1c94de.1380040307.git.alexandru.damian@intel.com>
Date: Tue, 24 Sep 2013 13:44:43 -0300
X-Google-Sender-Auth: 7ByWiVmQvjcceW3ZLTuPmyPBqkU
Message-ID: <CAP9ODKov1pJoYT17-eOaNcD6fqm=zc_xsbUOox30Gpcbtv1QTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alex DAMIAN <alexandru.damian@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] package.bbclass: trigger event when collecting package info
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
X-List-Received-Date: Tue, 24 Sep 2013 16:44:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 24, 2013 at 1:36 PM, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> Slight rewrite of the file-writing section as to make
> the code easier to maintain.

Please split the code rewrite in another patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

