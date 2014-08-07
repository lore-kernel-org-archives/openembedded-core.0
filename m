Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 811CE65CC9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 06:23:48 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so4860552pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C41MBxkNf2kAb1FtwF7KE5j82NPEGLHOXnldb/C9+Dk=;
	b=RymfaRQe2k8dXE0vhT49KEzEd6jRz4HRbM8OdbgKERNGdfUHSFRPCQm+4Kk9RoBzeH
	k2EP3HBtuDEdmoCpi57aH4Qnnv2ttNW3MkejodiAfA/jwb77qSkuB60GbsQlOeZOisKB
	hpIMqQFo1YTGVYjfVfUS9kdANhCEVadZFE+6PMXd2j5fB7UxJ4HiP+qCkbm5NEjOQJNp
	GGn/zQKRjF88AlHyhLJwIvrOxI4TzM18c3+0bCkWUnBmVscygHORn7Id+xhylGqbX6lP
	S7j+BOol1rWKS+34cQJWW5nqgpRubPOjQLNlBFvqJnUVB5fmZHiWiyNQFdHpqCJsbMTl
	63Vw==
X-Received: by 10.70.36.7 with SMTP id m7mr15558195pdj.91.1407392630314;
	Wed, 06 Aug 2014 23:23:50 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id ui8sm3197061pbc.84.2014.08.06.23.23.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 23:23:49 -0700 (PDT)
Date: Wed, 6 Aug 2014 23:27:22 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140807062722.GB4171@haswell>
References: <1407345781-16805-1-git-send-email-yasir_khan@mentor.com>
	<53E2B628.7030507@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <53E2B628.7030507@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] trace-cmd: Update to version 2.3.2
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
X-List-Received-Date: Thu, 07 Aug 2014 06:23:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-06 16:11:36, Saul Wold wrote:
> On 08/06/2014 10:23 AM, Yasir Khan wrote:
> >From: Yasir-Khan <yasir_khan@mentor.com>
> >
> >Current trace-cmd version 1.2 throws "recorder error in
> >splice input" error while recording a trace on kernel
> >version 3.10. Update the trace-cmd version to latest 2.3.2
> >to resolve this error.
> >
> >Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> >---
> >  ...dd-checks-for-invalid-pointers-to-fix-seg.patch |   61 -------------
> >  ...o-not-call-stop_threads-if-doing-latency-.patch |   38 --------
> >  ...etting-plugin-to-nop-clears-data-before-i.patch |   96 --------------------
> >  .../trace-cmd-fix-syntax-error-of-shell.patch      |   30 ------
> 
> We like to know why the patches are removed in the commit message, I know
> most of the patches are backports, but tell us that in the commit message
> still.
> 
> Thanks
> 	Sau!
> 
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> >-                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
> >+		    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \

this change looks redundant as well.

