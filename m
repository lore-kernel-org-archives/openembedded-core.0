Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id F390060808
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:09:36 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id to1so370057ieb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 20:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qTjsnhAZKT+M0nuP2lpknLJ9QeZtuRmlDVhhIqcqWFg=;
	b=s8uMr4M7RlTCoYfc6NuKdF9xRb4MipUtXSWY8iqNFbM5ZdTJgvN1IjvR47h9wqRf8d
	UfqCjlXYptPM6bmKRb9RUJr+Hq7q6sKY+YYAOqeF9GKOTIMKwvzUpgQCOaM1OqfECNY9
	4wmfIDs2bO9Cwe1mXE1B9gdRgF8OvCkI7Of8dYLwECg9crFjnjhO8QaTeKpWLAIHAZCv
	ADpXAEyoH92k6n4x4Wn/nJ6rDNkYKdp7TRNKLRFecSg4D0JhPH1MSP0rEPEh0aR9JDXp
	UZWbgBRymPYvx9gFPOSpid/W7jIStLpQ2tzoj5hPW1S6kyvLPV7zCIPXiimY3kW7TOsJ
	T3uw==
X-Received: by 10.50.78.201 with SMTP id d9mr1735580igx.17.1398222577948; Tue,
	22 Apr 2014 20:09:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 22 Apr 2014 20:09:07 -0700 (PDT)
In-Reply-To: <db84b0123ef1434809a5752719d24959938db202.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
	<db84b0123ef1434809a5752719d24959938db202.1398210385.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Apr 2014 20:09:07 -0700
Message-ID: <CAMKF1sqeOK+Jv7nVRgDafdAVc1=rQt+nkcHUN9L7KKrPr6X1xA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] mc: update to 4.8.12
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
X-List-Received-Date: Wed, 23 Apr 2014 03:09:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 22, 2014 at 4:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Remove the disable-samba since it's been renamed to vfs_smb and disabled
> by default.

can this be converted into PACKAGECONFIG while you are at it ?

