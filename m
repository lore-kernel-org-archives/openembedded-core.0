Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tl3Vl-0002jA-KJ
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 21:11:33 +0100
Received: from mail-ye0-f199.google.com ([209.85.213.199])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 11:55:57 -0800
Received: by mail-ye0-f199.google.com with SMTP id l12so1631895yen.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 11:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=kVCp3xHeLgp8Yv+aocu+70l8ihghHaj3w8P1jlCZyu8=;
	b=mEm8qiBA4EH9jOnBqGTGrK9dnmzZiICJB2Z19H8QToNo7GJMPX0uQgO085Qo71FoCm
	knXKZX7iCRggO9nfeFgKGYuaGdcEPkcLpcLNuN4GT6L+sFguzeU9W1aUc7Tu/CDoX83h
	KFHlEqeU1t0svejGl5QrwERhQk8vYLPxwKWeFnMOfI23Rk5O2Gxiy0cU5TMqVA1Y8Y5g
	cFO9pc1UW6gktWEvi5kfMWQUR7XmPscDMJUq9U3w8QApLnKz0lacsziZsskSVAisoQxA
	T+DsVIvavUJ1ugqPtviXtdEsxziR6CJjW0wKihmzt3wJH1DIXql6HVlOHDn3qcrycpqH
	NUGg==
X-Received: by 10.220.219.145 with SMTP id hu17mr4890468vcb.52.1355860609259; 
	Tue, 18 Dec 2012 11:56:49 -0800 (PST)
Received: by 10.220.219.145 with SMTP id hu17mr4890459vcb.52.1355860609177;
	Tue, 18 Dec 2012 11:56:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Tue, 18 Dec 2012 11:56:29 -0800 (PST)
In-Reply-To: <50D0C156.9050500@linux.intel.com>
References: <1355821397-23458-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1355821397-23458-2-git-send-email-marcin.juszkiewicz@linaro.org>
	<50D0C156.9050500@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2012 19:56:29 +0000
Message-ID: <CAJTo0LZDZjg3fycmeUdgHpkxQJBd3BQXiaSEB1hwJDE7NRO-yw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnBLFq+G+AGsj8O7WZxTwk0uq5p9eh2B7890UdmjknadumLv7f/SOkok6rEz0MH9zhcdwvZHWlZcMvS/nP+JU2043Hu50NlRg009aXdOUCzL2zRzEEj0atr+55wtT4Qcmmn9IZTDaW5ggpByhbQ1pRmdm2VUVQLyLNiMEb2jK9u+oEfgj+G9SunN25B25scKRxEdjYC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] slang: added gnu-configize for AArch64 support
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
X-List-Received-Date: Tue, 18 Dec 2012 20:11:34 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2012 19:17, Saul Wold <sgw@linux.intel.com> wrote:
>> +do_configure_prepend() {
>> +    # slang keeps configure.ac and rest of autoconf files in autoconf/
>> directory
>> +    # we have to go there to be able to run gnu-configize cause it
>> expects configure.{in,ac}
>> +    # to be present. Resulting files land in autoconf/autoconf/ so we
>> need to move them.
>> +    cd ${S}/autoconf && gnu-configize --force && mv autoconf/config.* .
>> +    cd ${S}
>> +}
>
> Should these be ${S} or ${B} (or some combination), I believe we are trying
> to allow for builds to be in a different dir where ${S} != ${B}?

Yes, I would like people to consider $S and $B when writing things
like this - whilst at the moment it's a disaster to attempt S!=B, I've
a branch (ross/bnots on poky-contrib) where I'm fixing/disabling the
problem recipes.

I this case, $S then $B should be right, afaik.

Ross


