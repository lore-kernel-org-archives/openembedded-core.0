Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.56])
 by mx.groups.io with SMTP id smtpd.web12.6096.1603963636092307400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i6rpY8Tk;
 spf=pass (domain: windriver.com, ip: 40.107.92.56, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0sse+gjLMY0xf+nsz6rX+eYg8fLip5p2B0JCmqOcqaWy8274D/XoBkMIyN23tw9J9zR3lLUzrm6YcdExBix51MpemYCcKxyqWs89BwdZORP1l8A9kr/ZiwD5e6WcJKt6TujEsDs0Hq71v8A+rr/v2SskqgtWCo2fTw8+4Tu0o0XhBOk5wu6ZUrILY+ru0nhnrZWuQcsk2fKs2i14a5JHDsw+F4nUfXdNKMwBBc2iWC5/vOsplhPQoI8Z/GrbDzydn4ptylgYz3hXSSVeEOBn5eC7G1Dbme4hqXbG/p0z6wVyFgEI8GGaRmPZSbiyk8wIco42qGTLojFiwQrliz9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBipty4aAVoxsHiKzvWDMMJfh9iFcQ3Y3SGEPR0KSlk=;
 b=LDmDx75YQM8Z+KK/hlbFbaTkVfXWzJgPjiZNkYrQHoEwgTl/oonc/DYqaetcKDjr0IIrjNGTZZJh9LT7lI9XXXpEqFyup/MtG8ylokFLTRTv+HwtYd96jQQVXoQh4yWEn/nk4K9eN9ByxUnVfnH9eAuHudAFmBKsmFipXLok2P+3wVXBCSoZUyTiXz6HJ/+zmzyyU830zB3LYYermsjfdbLWRnxLd55xDiOsYfyFg4PL38VUXIeYwY1AsaRQ872tcXp2fnYcj1czZw4efroQYN3oOSYJBGbYoUpisM7IbkQUfXRZhFJpiSgvzNF9QfrPlkfEzgL/nxJ9x/AAkehB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBipty4aAVoxsHiKzvWDMMJfh9iFcQ3Y3SGEPR0KSlk=;
 b=i6rpY8TkZPOYJc5PbOz2wAXskO3aMvqjbU7K7PwlRAoKidjURmxCkmiMj+ry4g6bSHMuoPDtwsL13DAP7zqQywplQc4lI+XBRGg+pnv2KwDtOcUkHVBIja6wLi9Gk0uylvC5VIK7M5bdGwSpB8XIuEQ4s4ANEGXFR8KmrteGmoU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 29 Oct
 2020 09:27:15 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::34d3:7c3f:9259:d3c5]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::34d3:7c3f:9259:d3c5%7]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 09:27:14 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] systemd.bbclass: check whether systemctl works in
Date: Thu, 29 Oct 2020 17:26:49 +0800
Message-Id: <20201029092650.34868-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:203:c8::7) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0002.apcprd03.prod.outlook.com (2603:1096:203:c8::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.10 via Frontend Transport; Thu, 29 Oct 2020 09:27:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c1ce6ac-b073-4406-3f20-08d87becd247
X-MS-TrafficTypeDiagnostic: SA0PR11MB4717:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB471770F85E97219FDEF3FE7895140@SA0PR11MB4717.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AUR1Yf27t7Xa1fA1eI5gDbG6hwSFAOFBp9GtnflJUktWYd6L/kYHG9edtuOrR1zeDxMuKd4Jruu1PK33AF0xuKnEwKX0Q3Lh3H9CKht0AEXcxTih/JcJkKGf7mQ4yVl7YcjRJkui6D87/TLY9DgQK75/91l8MWnRIkjXSDB5F5yJBSdvEsoAnzrpaMZ4Np07YzIaxA7HgPbVbfpXbDRcq8XDDDvC/FyO/Th/cOLN20bbHffWUFcsKqiy9ASJa1lJp5lhuTeaqpEwuV6c2IlgaxK2TQwenPjo7/le+0vuWJx3L0wCW5YA+GSoekIvAaFc+QengeUgyoWyW2SFbkv3rXR6+6z09sU2h53D2dcc+3EOHGX0zo/IqNULDnhCS1bWcnAKRVd54Ds/Gpt2p3Nw9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(86362001)(6666004)(6916009)(9686003)(316002)(83380400001)(2616005)(66946007)(66476007)(66556008)(6512007)(956004)(2906002)(36756003)(966005)(1076003)(5660300002)(8936002)(6506007)(26005)(186003)(4744005)(6486002)(16526019)(478600001)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LEzYLe4wkJxV3JML8KN1nF/NZh5aEMGBSOeqtXuyi27wEMNpb5za0Jvdyva0pL48x78PWTwNo0ZKxCBOuvqKetX+qsml7EWKR0jTx/slkwROfceUI0cxk57ZjpB63ArCm5q+7+AB5rtWShs4ZvxeKDGQNXFhVrS9H0qs3IfALU0WwtwNKYLkCSIOU3e4N96RD++6BetlxGNgjDOhttLeqORONNGSxE5TZSgqB4yLDQimSaBt77afxTVt3Pu+pVMmAKv6eZBFTWHRRyBiu4uvJbUXKlzF0Cbna2KW4rezaEH8DkVeA5qUuFXGWsyGHfnEJkYmjn/Y35pEqhGfMxIB6vffj9Nq4qBsw5iwxUEMQrV9kMU56+leLQ0ByDkrP+UcLfhlRVLR0KuSJZq0dKOQXxPafaU+Gx9NBft5p59NlfyxAsdKQmmxV8/J14jt76lpqGfcJGCvn5T/06uV7CvFvr+vZ1vtAF++Y0WwFX94Xn/MZAEugXBrD8gJLBm1u7/0udrEnpY0LPRCTuFZBhc4QreMASeiF0+3Q9d7x6CdxoyxTF5c0hsyweGA6IkR3aKVINbW/3ow/OkZaMxKfDEEKPfvUVZ7mTNrGgXm+M/oid1BTIGc7MY3OAhMcXOaQ1nnWtKbdEMY/u+e8EEwDGNxDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1ce6ac-b073-4406-3f20-08d87becd247
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 09:27:14.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbwvtr9P9QSUSTZHp92HIyTaG0fsr8rm1HSW2czStNOIsDHGP4pp94kr9+CWywMKsehGv6vvjMMv+lls5U5+cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run systemctl in a container even though it exists. Check
with 'systemctl list-machines' to make sure systemctl works.

And there is another issue that /var/tmp is a dead link to volatile/tmp
which doesn't exists. Changqing has sent a patch to fix it. My concern
is in FHS, /var/tmp should not volatile. Could we make /var/tmp as a
common directory rather than a link without extra config?

Ref:
https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html

Kai Kang (1):
  systemd.bbclass: check whether systemctl works in post scripts

 meta/classes/systemd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

