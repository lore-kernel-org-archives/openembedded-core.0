Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 88D37607A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 11:01:55 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id i17so3431471qcy.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 04:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/QcnhY7dXL2FQNl35HCkj1hrRZmFtY09tXukC2FFMuI=;
	b=P5yxBkp4jZPF1JE4DvVZlHej9elBzEXUgMVOpQN+hRbZsHfDor/Bjq3XYRdhve2/5e
	vWc+YR5+iodsn1HT4zPfOVFV0ZFiSDGLtVzA3ED2OwW1vKMadX2O3qzjBiS8rwMUDAii
	i41pmNq5Uo7megi2sJM43AkoOokKA+iTW2ewJd0nYjlZECbPJ5j6HZQ4JDiU8vif/+Zv
	ZuxZ8ap9OYwzt5XE4a1nNb3jais25GFvqp7g3PB8omG4xxRUDHENd9Pvllk0Fr+jOV+x
	YjTM91eLZWrOhjsAURrxa9Lb1aGJf9pik3gAEkCfbobRbEhTobPij65T7JSrWTHCdMeS
	5L1A==
X-Gm-Message-State: ALoCoQmD0WB42qlx5LC5W3OC63JNtqTSdvkL7vP9CB+hqKHdYRqW7Y0tbLT/nPyjvmW8vJ10DjhN
X-Received: by 10.140.96.101 with SMTP id j92mr24675190qge.87.1413802916481;
	Mon, 20 Oct 2014 04:01:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 04:01:36 -0700 (PDT)
In-Reply-To: <1413424950-14820-1-git-send-email-rongqing.li@windriver.com>
References: <1413424950-14820-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 12:01:36 +0100
Message-ID: <CAJTo0LZvOGjzLdM_itgf=dFMvPCe=bS=+L0Fc_o6HbddY9Gtbw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: rpm needs gnupg to do signature
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
X-List-Received-Date: Mon, 20 Oct 2014 11:01:57 -0000
Content-Type: text/plain; charset=UTF-8

On 16 October 2014 03:02,  <rongqing.li@windriver.com> wrote:
> +RRECOMMENDS_${PN}_class-target = "gnupg"

Recommends means pulled into images unless you use BAD_RECOMMENDATIONS
to remove it.  As signing isn't a key part of RPM, maybe this should
be RSUGGESTS?

Ross

