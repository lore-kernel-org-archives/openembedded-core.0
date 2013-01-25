Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TynEI-0000nP-Sa
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 18:38:25 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so711224oag.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=rR+W4XNbLOXnJT7r4ogz9zo3/oVHRHgfZ5hefL+1QqQ=;
	b=Bz3MuG7ovxoR/ReSn+LrUbSsqq1qdRhC0oMF1Iwl1Q8GVIAe2fDEV7tst+Uo9NfnTQ
	XdW9sWM2zzsTyCJcIWZ6nA0B2bmV0SCD6MwxB85KuruTkQOcOAGDCIbd1krKa+JZ9UCp
	PFTZxOFGTauF+SOd4L0eeCmsH+ByLkkQG4um/ZSdvRtkwq0lff6EjiU9tGAUL3dIAsEz
	7Xbjkj/S4QBtSaL+bSV0riF0MttN9TuyrmkkmU2rxfELQKKOqqBPK1aRVHaTyckAX1MZ
	oITXK7YS0losVDu9XVAvghlYl7p7k1S32UkEPnLrSK/Dw1jP8AufsXwk2yAIB/Mact8H
	vNFw==
X-Received: by 10.50.56.232 with SMTP id d8mr4452221igq.112.1359134560239;
	Fri, 25 Jan 2013 09:22:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Fri, 25 Jan 2013 09:22:09 -0800 (PST)
In-Reply-To: <1359123600.13917.2.camel@ted>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<42bd84e2dd6a8f88e8e8433ccf0d0c4d4866cc6e.1359061155.git.raj.khem@gmail.com>
	<1359123600.13917.2.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jan 2013 09:22:09 -0800
Message-ID: <CAMKF1srim=A79OmZqmXRvrTgVZfL7nvtGJRB_skcSSPWZ=hNQA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/11] rpcbind: Dont use nss with uclibc
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
X-List-Received-Date: Fri, 25 Jan 2013 17:38:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 25, 2013 at 6:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> +
>> +LDFLAGS += "-lssl"
>
> The LDFLAGS change should really be marked as ublibc too...
>

actually this change is not needed at all since I change libtirpc to
not need ssl so I have removed it and pushed a new
patch into the pull tree rebased on todays master.


