Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 203A475E80
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 14:25:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p14so2134952wro.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+7Vtc1o+1O0Ov33ouigVWVN8OubpjX6gqB/DVBIE+mg=;
	b=XmQ92EXBimwwf0jngGQa9vJQkvihioWS1h10/EraemTq/ARIgveCYH8Sf2gitFs0Wk
	ZY0FzHrFLZBnQgwP9t0OdYKJ6onUm/0FY50blf7hWfP154xNlgo1A4W6zGNxl8CfFLYK
	oBRZUs8oHfCZw5eex0+F5IsqOxe9gvZGzX7YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+7Vtc1o+1O0Ov33ouigVWVN8OubpjX6gqB/DVBIE+mg=;
	b=B0JrnQMabKrG0vILz00a5TZa30qngequAbe6+jpaZKTB7/JjH0tubhQxRBEEoZM7lz
	I3KTtRv3pyNQO/EpxAEUEodzJ1ycXdz4o19L4yiv2umT8DQguqMzMgHFxFfvkZBDjVsL
	ifiXu/aqfy5HxsZ4SUNsDXoDU7dz3bUmYnCMVPtxysjEpgMFjhFuagypOulmQiwOgNC/
	sqIzCgSSV+vf5l0XTefXpzSGm21xhd+GiNL1KRb9fZyTe7XOyGKrj9aTouyg5fdUoSG5
	IJQByq/ZmvoX9ztpQ5v5JfZvBXyAN9nAzbUS/MzZH44MhPVJGhFXeve/nCIloWC4ouFK
	FIbg==
X-Gm-Message-State: APjAAAXMu+Jy0Nza1Go3ZWmzUCoOco01acogGEv4HQWx8m8ntQy+Uztq
	ebd1fV0r52NEhOFDLTPyNIjTIA==
X-Google-Smtp-Source: APXvYqyuY9dxAhPCbZG8zgkrozc03S1XKzSew9yIzLYJQEZZukOjjU/ntdmQo72J7kiC6iMmMlOatg==
X-Received: by 2002:adf:eb8d:: with SMTP id t13mr6740750wrn.53.1570112708740; 
	Thu, 03 Oct 2019 07:25:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o188sm6489646wma.14.2019.10.03.07.25.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 07:25:07 -0700 (PDT)
Message-ID: <d1aa8e89345aee537ebe751a6be65db92002e325.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Scherer <Konrad.Scherer@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Oct 2019 15:25:06 +0100
In-Reply-To: <eecb2354c35a8a2c788b1cc919339e7931619dd9.camel@linuxfoundation.org>
References: <20190927185642.29251-1-konrad.scherer@windriver.com>
	<4ad724ca50b35e495d2eae800edd83c60b7128bf.camel@linuxfoundation.org>
	<34a7db7f-83b3-f51f-9628-615762b44e91@windriver.com>
	<eecb2354c35a8a2c788b1cc919339e7931619dd9.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [master][PATCH] gen-lockedsig-cache: Replace glob lookup with hash to filename lookup
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
X-List-Received-Date: Thu, 03 Oct 2019 14:25:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-02 at 16:25 +0100, richard.purdie@linuxfoundation.org
wrote:
> I've queued such a patch in master-next and am testing, its an
> improvement but I'm worried its not resolving the problem.
> 
> Options are to prune the sstate cache, or to teach the code to
> generate
> the full filenames (would mean refactoring)...
> 
> We could give you access to the autobuilder to help reproduce the
> problem but I think its clear where the delays are...

We've cleaned out the sstate on the autobuilder to try and reduce the
impact of this issue as this patch, whilst helping, didn't solve the
problem.

I'm wondering about a different approach.


Just to elaborate on what teaching the code would entail, as well as
using the 'hashfn' data as part of the hash validate function in from
runqueue.py:

sq_data['hashfn'][tid] = self.rqdata.dataCaches[mc].hashfn[taskfn]

we could inject that data into BB_TASKDEPDATA. If we did that, the
oecore code could probably create the full sstate tasknames for the
tasks it needs using logic extracted out of sstate_checkhashes() from
sstate.bbclass.

This would mean the script wouldn't have to guess at filenames, it
could access them directly.

Worth some further thought...

Cheers,

Richard


