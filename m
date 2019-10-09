Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6E247DE87
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 17:58:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q9so4100985wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vLY5j80u6Jjtp4BE47XpyIJ2nFvTg0YM833xkhnAwoA=;
	b=MV4fQFVsHpxS9ApgXqGuktS8kn1KHFNxvtrNt8F29q+U9BwXnHUWmOuONQa3GMrSJi
	kAWdMwvH176IqGtMB/Q8tNmZvnyNbiOREjduT5+ME+82wb99trZmxfvoPpVUSFMaDEyd
	RiNIJ5IKYEFCTyu/dSBwikrRk8riL1sFSz9O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vLY5j80u6Jjtp4BE47XpyIJ2nFvTg0YM833xkhnAwoA=;
	b=FE/QKFU2lk6p37XNB7/HbCRkpR1f5a1cfq+0u1JOVzJiKahuKf9ZBNTUV9lHg41UA6
	4N9TaVS93nPUP+Z4VzhvybaqiK8hZFgURCo9g1AxePSgqstFgDQRNu44WADsCOmT9Wht
	2u2TT76J9/z3twniuTkg7ZaHOuS/9ycB96QEe79waTd7atEz6YnM+VOb02mRW4w5KFno
	a6nsIMpVe9jC+s8s5B+XAtzV1GoxF05uvH9tCh4gWjdP23ucwauq7r22MnwlekOPjCGL
	P+IDnuPTgMk1RifZ7lawDpUFnq/FoWRIOUHuMVSaN7sO+4diXSXQixP+hSQouE65gSIE
	U6Fg==
X-Gm-Message-State: APjAAAU2jHQs0SddoAEBZERtc8DRSdWIpfZa7tJGyoE9We/feot3UDys
	kNFRM//rWtwXoOfYI+kkYdKb+w==
X-Google-Smtp-Source: APXvYqzNgRntOYGRMGylqq5RivC5EPPsojEQMk+M7rIBfHCmhdm4w80omv/idtO6xjxMVbOUsJU+7w==
X-Received: by 2002:a5d:43c1:: with SMTP id v1mr4176592wrr.91.1570643884360;
	Wed, 09 Oct 2019 10:58:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o9sm4654761wrh.46.2019.10.09.10.58.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 10:58:03 -0700 (PDT)
Message-ID: <1d21f37ebf6e5b9bdbb82be87f57c0f226eec85d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 09 Oct 2019 18:58:02 +0100
In-Reply-To: <20191009170543.74807-2-andrei@gherzan.ro>
References: <20191009170543.74807-1-andrei@gherzan.ro>
	<20191009170543.74807-2-andrei@gherzan.ro>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] image-buildinfo.bbclass: Introduce IMAGE_BUILDINFO_GITDESCRIBE
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
X-List-Received-Date: Wed, 09 Oct 2019 17:58:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-09 at 18:05 +0100, Andrei Gherzan wrote:
> This knob can switch in between having full revisions and having git
> describe references in the build info file. By default it is set to 0
> to
> maintain the old behaviour.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/classes/image-buildinfo.bbclass | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

I'm not sure we want to even encourage this. We probably do want to
print/store the full hashes as output from this class as they may be
used by CI or in bug reports. The could be unique at the time of
printing but clash later. The output is also dependent on the fetched
tree.

Cheers,

Richard


