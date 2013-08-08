Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id C7F006A457
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:32:49 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id o17so5571707oag.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rd5SAXTvkeP8HUIpLzQSq1GBTb9mjNTjkQ5EZlZ5JkM=;
	b=FJJwxjraQkwgDHstQJNHrF0cY/eFAYwsDW2EYWx4e5spToinavxTGDoe6esQVX76iF
	a/tbWwKHmaVGY0J828DbH1stTARkKUxzf9BQq7M4SX7rF+nojOlkeWQwD8mhsmiKRjBx
	gwczogKf9WAEa3PQOBLyhoeVIwig01Un7PgDLF6mn38n9/YMdgrcO9WmJWpWD5NeiC8N
	fObbDX/yuJ4eN0uDWGvz45ThlnohXTFo89ImsN5qDv6Gv4CA9kliEL9TCBetzThL4aJm
	Bp21sUa2OPosYeMIkvTvO9X0/8zzGhx0DnMLFeOgN3wj9A8nYQwDGs5B9/bAJ+1ndB3L
	wWvQ==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr4843443oeb.57.1375979570021;
	Thu, 08 Aug 2013 09:32:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 8 Aug 2013 09:32:49 -0700 (PDT)
In-Reply-To: <1375979385-2063-2-git-send-email-ross.burton@intel.com>
References: <1375979385-2063-1-git-send-email-ross.burton@intel.com>
	<1375979385-2063-2-git-send-email-ross.burton@intel.com>
Date: Thu, 8 Aug 2013 13:32:49 -0300
X-Google-Sender-Auth: Dz21L6ZOotYPLsXk-CbkovgeFkE
Message-ID: <CAP9ODKo+=f3n70jDB6r_TCySBiVWe+LBWHC0Mx26Mv0_k6aoGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] seperatebuilddir: mesa now builds out of tree
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
X-List-Received-Date: Thu, 08 Aug 2013 16:32:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 8, 2013 at 1:29 PM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This should be squashed on 1/2 as one is dependant of another and in
case of a revert both would need to be reverted.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

