Return-Path: <slavasalnikovv@gmail.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id EF72E74C75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 12:51:23 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id y5-v6so9888268ybg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yta+wB6ocR/X3jQkLFfYyPXcUkCdHZYJ6xVZpU3gG3k=;
	b=bkmpnYUAzlRI41oxlPWQsb3IUSYeKiV3ZI3vB001yipLQKDmsAnRfaqNE+OLoXdQWv
	RgvGaPCuIjWBl4wCQvXcBRxB2TYN0c4vqU9nWN79KDA7h6I0UJg4HVopfiLxM2Jb33DP
	PByTiFtjsQHQBAgQgFj497ZTsZb7emxyeMiC8alxVDBvsZyMibg5NALFPADhTDPDW7ce
	N5XhtlbE5Kh9EEv+ENwF8vmaIE8pkVURBua82lhEte/zLQZOZLnSrvrGr24VCPICtnAy
	4PUg2eOSdZFG6la0f3HdLWDV5+m1eRhxiXmiRo/R/i30vySlBXi7AvMqunwUX6QKHtE5
	/5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yta+wB6ocR/X3jQkLFfYyPXcUkCdHZYJ6xVZpU3gG3k=;
	b=kJnFd1g0Md00n9XIC0rIPDu/HCcJcX+0rJr8FjVeF1ugs6L0DcLq5hUoShIeMHJTPE
	YfYBtRilVza8qpkuCwdSiZmCTsm4FNUsEPSl1XX1lQxB47eYWLkVJNn8zW/XIj1uS0/4
	hxKABFZZL5RFmigwncDg3yuNe5k8Ab8vI2HveG57H3N29TID512hp083ALEKJfzj0RGN
	nJZ/nEpHFC9Zn98yyffUezs/+Lc/PgigjlqGpQoaD5pn3dbqF3gS4pvu98Dgz3ECbmn5
	SWfQ81HBLzes1IRl/UsxcaNfIOUzktZ8sa0+Bw4Rejyjbas7Cq4afOOHm4G1BcOszIe+
	Om+g==
X-Gm-Message-State: ALQs6tD88SKZlocfe/zQ833tm23WdsbNUW8y8y5M0URhkkOjHniRkj1Q
	M+MBGHS21Bsu92czukr8tKxXNBs86U2DkaUMHsUxww==
X-Google-Smtp-Source: AB8JxZrIfUrvozt2qBdSKYT+pyxNLYKZClhRKI3PZAifwkTIXTAj5oL4SZ7K1KaL/hrnKAsBAsOMJZNxCyRVRyRa6Qc=
X-Received: by 2002:a25:6e03:: with SMTP id
	j3-v6mr17807090ybc.116.1525697484427; 
	Mon, 07 May 2018 05:51:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.51.88 with HTTP; Mon, 7 May 2018 05:51:24 -0700 (PDT)
From: Viacheslav Salnikov <slavasalnikovv@gmail.com>
Date: Mon, 7 May 2018 15:51:24 +0300
Message-ID: <CACAZDOmB7+7WfZfzt_qxinq48ANmsbm_q0nrmneAuN7gM2pJvQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: cURL recipe: SSL backend
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
X-List-Received-Date: Mon, 07 May 2018 12:51:24 -0000
Content-Type: multipart/alternative; boundary="000000000000981917056b9d20b3"

--000000000000981917056b9d20b3
Content-Type: text/plain; charset="UTF-8"

Hello all,

cULR is built with GNUTLS for Target but OpenSSL is used for native and
SDK.

So my question is: why GNUTLS is used only for target? Is it necessary for
some good reason? Documentation for cURL has no explicit answer for that.

Could somebody help me to find the answer?

Thanks.

--000000000000981917056b9d20b3
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div><div><div><div>Hello all,<br><br></div>cULR is built with GNUTLS for Target but OpenSSL is used for native and SDK. <br></div><br>So
 my question is: why GNUTLS is used only for target? Is it necessary for
 some good reason? Documentation for cURL has no explicit answer for 
that. <br><br></div>Could somebody help me to find the answer?<br><br></div>Thanks.<div class="gmail-yj6qo"></div><div class="gmail-adL"><br></div></div><br></div>

--000000000000981917056b9d20b3--
