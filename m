Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVfMc-0001Cu-1p
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 11:54:47 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz10so1699698veb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 02:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=nd85jawvMWqpUbPFDRkYK63Ex8DU1IEtHvGpRQrkssU=;
	b=Sh4umY+UV0WrWDxX8Byvfa7FoOn+ZoJUPBPfSsbrXHXfyZcFqSPWKlxRnA3P7seUxl
	+zxg4vzirNdm/i5NdXtQsKhssuND3uRZALrHSvj8zBGx9X7alojkNddg/1yXW5DTuqLd
	uBejC8dKFA1yk5aQcn5tgyw+sTLUyhdwzxgW4+ywH/VeoBDygLxf/7JFeuqDguo5wAE4
	06tuQ/Rs+kwNXFaY2OiopRpX53WeVvTnTvkP7BNOkCl5tslP6OvR7Vn9igiv3oOxH2As
	cj+K/YNzXpHRDZW8u7gOb2t1sXzZBejaqsXWbf9bZajbFk7Lca6raPNDXG+KDMgjN4XF
	E60A==
X-Received: by 10.52.165.99 with SMTP id yx3mr10839629vdb.34.1366969021091;
	Fri, 26 Apr 2013 02:37:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 26 Apr 2013 02:36:41 -0700 (PDT)
In-Reply-To: <517A49FE.5020702@communistcode.co.uk>
References: <1366963623-13626-1-git-send-email-B40290@freescale.com>
	<517A49FE.5020702@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 10:36:41 +0100
Message-ID: <CAJTo0LZEd0ZDONxj5-_h6e13VYtDbQPTC+ipcj-=wzDavNUCHw@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQmsWb/eEsN3upvtyMfTPuIs4c7xbsBuL91S4U3AFgbMlHHRGPn/hEmvg68+f7dv7a6wN8KD
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 09:54:47 -0000
Content-Type: text/plain; charset=UTF-8

On 26 April 2013 10:33, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I think if anyone needs it, shout up; otherwise we should go with the
> default and disable it.

Agreed - we can PACKAGECONFIG it and the machines that need it can enable it.

Ross


