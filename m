Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 683857718C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:38:56 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g62so43312679wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8BQKEZCepgOHz82TPvp0fQdozuxkZEji4H5vSHAc/2s=;
	b=POhso7Eg1NpxUmyH4yr3BGQn6tmlLAb+HYTAatAHbxFsmPTRwJfQlNtQduGGB7TRMn
	MmbOZRreuBJ469er0arlR+8yBO1UMVAPBBUUyl8ya/0eaeRLUiUfDBSDpuVrIv1FXPmY
	OfQbxSudx03/glLkmFp8Kd9QmseJ22j0FmQUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8BQKEZCepgOHz82TPvp0fQdozuxkZEji4H5vSHAc/2s=;
	b=nFHfqUjBHqsiBD26lamGPT6xOabL+oj3fJudBgF/LJGzW0DxAGDaE6A4ki+nex7Hb0
	ypYJfE09rZRK0V3sKxikKZ9/vbypWA3+VLNMiCHXbuws6v8SuvUORfMp7RUIPVxbwka4
	dpB3V37i3wJBwFXikrD2E0g205in4g+PPP4+yk9hXo4h219sQSRKOyFl3SpIdLlswk3X
	Q0uBi2YwrlCPPGQbPVOnBM8PoSOEc/S/zJCkOONm3cRTmXjVQSvGghpenymJwprnn6kp
	4gdWJMT/SJCMGEF7ym7YxHPyEZ0F8f1KfPcCLE+/HbR641npLJ2lzJ8N22ZZrzPae8uR
	LFPw==
X-Gm-Message-State: AG10YOTAQO8mjIROBgTnVoazwDNUnDVhYHX8Vh4AOMLv51S9ZchKL1prVeS6F8sf7KEHsrihJyQ0LU6YX7wZTJzq
X-Received: by 10.28.186.87 with SMTP id k84mr18131879wmf.13.1454704737379;
	Fri, 05 Feb 2016 12:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Fri, 5 Feb 2016 12:38:37 -0800 (PST)
In-Reply-To: <1454692617-25631-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1454692617-25631-1-git-send-email-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 5 Feb 2016 21:38:37 +0100
Message-ID: <CAP71Wjz5ZDLMQh97g_zmNgoxuJSzeDnVHk3iiMpq_hWY1m_yBw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 20:38:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 6:16 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> * update SRC_URI and checksum.
> * use libcrypto for sha1 functions. In upstream commit a24bdce4, support for
>   SHA-1 was copied from xserver repo, so let's use the same default for
>   --with-sha1 option that we use in xserver recipe in OE core.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

argh.. please ignore.. I will resend with proper use of -M options...
the diff is not as scary..

