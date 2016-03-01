Return-Path: <lucas.dutra.nunes@gmail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id C76427317E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 13:17:37 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id g127so148181154ywf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 05:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to; bh=MXrD2FncC3PJFU4e//ocFszDoHIn9FRPSGablXpV1r4=;
	b=zD+69hubpsi5REMrzci24fzFD3CkEE7QMZTg1SrK6XCqSjwHeFSOJvNIkyioIFVbEQ
	awU5W+XqPDN9pxEQTEXW+mNbDTKMtJvCdHKRZnIMUN3QwSwg8bxfVFtMzdDXwpNdTqdi
	5nDmSAP36VXCg3eSCNMnFF1hGemZW6ib9C69/9X2COdVBKE0HlKv9sNQhXxNYJzKI5i6
	kIF6iVERjcyeiwDMgQUEpigMEyerY0ByeBUg/MhNCEgPCGVmmaPV5mH5FegPfqdMr/iH
	ZUY3LZhtfcawtCATs2cb3YWn3AOuIWzDCTPKu+KYtEjNchkJNFqLCslim5646ZDys6Sm
	jTnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to; bh=MXrD2FncC3PJFU4e//ocFszDoHIn9FRPSGablXpV1r4=;
	b=1hAU4LAsObbojzp+U6Xff9UP4n3zlhCNfDKf/iJttzlHWTMgAOwMGEglDBGFEizHo4
	pRwHt345CqQt5a5K46IfVWw7IKItmZcBV72rt/XM6g15Nlq9ST0Au7jSKAD4QaGzYb8S
	pzVUHUYm6eRCywG0kcHNZQzHTX3Bien8N9vN/YRqwWQXKMoyD4AqPC7rXL88bTWb1iX5
	IPDTbBodvCK4/nMgo9JED5Kg39kthj/jVs17oXxtKnIkBUtGK2bxaF+42CrIbeMZGJLB
	O7+iMaSGY97viqz90nIUe7yIENyN9oM1DdGGF+Hnf8ePPMMx4CZJr1VUyQ6U45W+8Sgv
	zinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=MXrD2FncC3PJFU4e//ocFszDoHIn9FRPSGablXpV1r4=;
	b=g7nQvUOvgXZcNC1u6sJiRfnOg54Ea4jBkpUsBeAOPbduJ1R1jep0viDTvHb6VkSETn
	+1ADgqkjOFI2GqfVYXS/fxtHPd8iPqt0ahDd39WB+M3HwM70ttUpP91l19xP6mc0MHMp
	TcginBE1es7bjHjN/OLzguSwWuU7UeCrPY7jqZdBiszqcYRNAR7z1F5v9AXrepIlnhqk
	a/3kSQsXTKmTkW4JSgu6nMei01WUq7e9FQFvAt+mr8IiOBVlfZfy/q+hLiEwkDMf/ELi
	yMZC7Fum2Pv+SzGLGw2ZNR19qctN1iFQdykza/y4Rpt6dPx4Zd5LN0abbIJV71cB+y2e
	WHsQ==
X-Gm-Message-State: AD7BkJJ7mN6M5y4lLnJeTvIqqwLm6kyPWnyEzIut++qKQKZIW5jw6fru/Ag2biOfgiNbnqYwffi6i1PAmsJxZQ==
MIME-Version: 1.0
X-Received: by 10.129.155.151 with SMTP id s145mr11172668ywg.24.1456838258117; 
	Tue, 01 Mar 2016 05:17:38 -0800 (PST)
Sender: lucas.dutra.nunes@gmail.com
Received: by 10.129.147.65 with HTTP; Tue, 1 Mar 2016 05:17:38 -0800 (PST)
In-Reply-To: <1456838116-10650-1-git-send-email-ldnunes@ossystems.com.br>
References: <1456838116-10650-1-git-send-email-ldnunes@ossystems.com.br>
Date: Tue, 1 Mar 2016 10:17:38 -0300
X-Google-Sender-Auth: ZqtCRegYvBLySIch_XYKPuQc5Q8
Message-ID: <CABLrhkht6ER+C6JMSZa69A9z9Ufp84dxWH-dK0R4cokEkkVfVg@mail.gmail.com>
From: Lucas Nunes <ldnunes@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [Documentation][PATCH] Server comm: try connecting 4 times before giving up
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
X-List-Received-Date: Tue, 01 Mar 2016 13:17:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b8da8ded4c0052cfc96da

--94eb2c0b8da8ded4c0052cfc96da
Content-Type: text/plain; charset=UTF-8

Please ignore the [Documentation] tag, I forgot to remove it.

-- 
Lucas Dutra Nunes

--94eb2c0b8da8ded4c0052cfc96da
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra">Please ignore the [Documentation] tag, I forgot to remove it.<br><br>-- <br><div class="gmail_signature">Lucas Dutra Nunes</div>
</div></div>

--94eb2c0b8da8ded4c0052cfc96da--
