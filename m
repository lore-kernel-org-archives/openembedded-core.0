Return-Path: <purushottam27.kumar@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CD9D2FFF4
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 11:21:18 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.19726.1729250472560622439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 04:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: purushottam27.kumar@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 18 Oct 2024 20:21:09 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: purushottam27.kumar@lge.com
Received: from unknown (HELO lgeapazms23a.lge.com) (10.226.50.14)
	by 156.147.1.125 with ESMTP; 18 Oct 2024 20:21:09 +0900
X-Original-SENDERIP: 10.226.50.14
X-Original-MAILFROM: purushottam27.kumar@lge.com
Authentication-Results: mailguard.lge.com;
	spf=pass (lge.com: domain of bounce+67612+206030+8515912+13287821@lists.openembedded.org designates 66.175.222.12 as permitted sender) smtp.mailfrom=bounce+67612+206030+8515912+13287821@lists.openembedded.org;
Resent-Message-Id: <202410171558.49HFvdTC029152-49HFvdTw029152@mailguard.lge.com>
References: <20241017095410.3475084-1-purushottam27.kumar@lge.com> 	<CAMKF1sq5T1n2_Uwph5KAru9U_hRHzZAee=0HgYhBstRBOKfvfg@mail.gmail.com> 
	<OF7E422025.EE8D56D7-ON48258BBA.003E5C60-48258BBA.003E5C60@lge.com>
In-Reply-To: <CAMKF1sq5T1n2_Uwph5KAru9U_hRHzZAee=0HgYhBstRBOKfvfg@mail.gmail.com>
Subject: RE: [OE-core] [styhead][PATCH v2] kmscube: Upgrade to latest revision
Precedence: Bulk
List-Subscribe: <mailto:openembedded-core+subscribe@lists.openembedded.org>
List-Help: <mailto:openembedded-core+help@lists.openembedded.org>
Mailing-List: list openembedded-core@lists.openembedded.org; contact openembedded-core+owner@lists.openembedded.org
Resent-Date: Thu, 17 Oct 2024 08:58:53 -0700
Resent-From: raj.khem@gmail.com
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://lists.openembedded.org/g/openembedded-core/leave/13287821/8515912/906813312/plugh>
MIME-Version: 1.0
Reply-To: "Purushottam Kumar" <purushottam27.kumar@lge.com>
X-Priority: 3 (Normal)
From: "Purushottam Kumar" <purushottam27.kumar@lge.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <OF7E422025.EE8D56D7-ON48258BBA.003E5C60-48258BBA.003E5C64@lge.com>
Date: Fri, 18 Oct 2024 19:21:08 +0800
X-MIMETrack: Itemize by http on LGEAPAZMS23A/LGE/LG Group(Release 10.0.1FP7HF9 | October
 27, 2021) at 2024/10/18 19:21:08,
	Serialize by Router on LGEAPAZMS23A/LGE/LG Group(Release 10.0.1FP7HF9 | October
 27, 2021) at 2024/10/18 19:21:09,
	Serialize complete at 2024/10/18 19:21:09
Content-Transfer-Encoding: base64
Content-Type: text/html;
	charset="utf-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 11:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206056

PCFkb2N0eXBlIGh0bWw+PGh0bWw+PGhlYWQ+PHN0eWxlPnAge21hcmdpbjowO3BhZGRpbmc6MDt9
IGJvZHksIHRkLCBidXR0b24sIHAgeyBjb2xvcjojMDAwMDAwOyBmb250LXNpemU6MTBwdDsgZm9u
dC1mYW1pbHk6U2Vnb2UgVUk7IGxpbmUtaGVpZ2h0Om5vcm1hbDsgfTwvc3R5bGU+PC9oZWFkPjxi
b2R5IHN0eWxlPSJjb2xvcjojMDAwMDAwOyBmb250LXNpemU6MTBwdDsgZm9udC1mYW1pbHk6U2Vn
b2UgVUk7IGxpbmUtaGVpZ2h0Om5vcm1hbDsiPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEw
cHQ7Ij5IaSBLaGVtLDwvc3Bhbj48YnI+PC9wPgo8cHJlIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUt
d3JhcDt3b3JkLWJyZWFrOmtlZXAtYWxsO292ZXJmbG93LXdyYXA6YnJlYWstd29yZDt3b3JkLXdy
YXA6YnJlYWstd29yZDsiPjxwPml0IG5lZWRzIHRvIGdvIGludG8gbWFzdGVyIGZpcnN0IElNTyBh
bmQgdGhlbiBiYWNrcG9ydGVkLCBrbXNjdWJlIGlzIGEKbGVhZiBwYWNrYWdlIHNvIHBlcmhhcHMg
bGVzcyBvZiBhIHByb2JsZW0gZm9yIGJhY2twb3J0IGJ1dCBpdCB3aWxsIGJlCmdvb2QgdG8gbWVu
dGlvbiB3aGF0IGNoYW5nZXMgYXJlIGNvbWluZyBpbiBkdWUgdG8gdGhpcyBzcmNyZXYgYnVtcCwK
d291bGQgbWFrZSBpdCBlYXN5IGZvciBiYWNrcG9ydAoKLS0mZ3Q7IFNSQ1JFViBidW1wIGZvciBL
TVNDVUJFIHdhcyBtZXJnZWQgZm9yIG1hc3RlciBicmFuY2gKPGEgdGFyZ2V0PSJfYmxhbmsiIGhy
ZWY9Imh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lkPTg3YmU3ZmJm
N2E1YTk3MzBlYTkxN2MzODMxMTM0MTFmNzM0OGMyNTUiPmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcvcG9reS9jb21taXQvP2lkPTg3YmU3ZmJmN2E1YTk3MzBlYTkxN2MzODMxMTM0MTFmNzM0
OGMyNTU8L2E+LgoKRG9pbmcgYmFja3BvcnRpbmcgZm9yIHN0eWhlYWQgYnJhbmNoIGFuZCBJIFdp
bGwgYmUgc2hhcmluZyBhIG5ldyBwYXRjaHNldCB2MyB3aXRoIHNyY3JldiBidW1wIGRldGFpbHMu
CgpUaGFua3MsClB1cnVzaG90dGFtCgpPbiBUaHUsIE9jdCAxNywgMjAyNCBhdCAyOjU04oCvQU0g
UHVydXNob3R0YW0gQ2hvdWRoYXJ5IHZpYQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnCiZsdDtwdXJ1
c2hvdHRhbTI3Lmt1bWFyPWxnZS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDsgd3JvdGU6
CiZndDsKJmd0OyBVcGdyYWRlIHRvIHRoZSBsYXRlc3Qga21zY3ViZSByZXZpc2lvbi4KJmd0Owom
Z3Q7IFNpZ25lZC1vZmYtYnk6IFB1cnVzaG90dGFtIENob3VkaGFyeSAmbHQ7cHVydXNob3R0YW0y
Ny5rdW1hckBsZ2UuY29tJmd0OwomZ3Q7IC0tLQomZ3Q7ICBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
a21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KJmd0OyAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiZndDsKJmd0OyBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgomZ3Q7IGluZGV4IDM0ZDVhN2Q3MWQuLjAxZWE4MGEx
NDIgMTAwNjQ0CiZndDsgLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3Vi
ZV9naXQuYmIKJmd0OyArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJl
X2dpdC5iYgomZ3Q7IEBAIC0xMCw3ICsxMCw3IEBAIERFUEVORFMgPSAidmlydHVhbC9saWJnbGVz
MyB2aXJ0dWFsL2xpYmdsZXMyIHZpcnR1YWwvZWdsIGxpYmRybSB2aXJ0dWFsL2xpYmdibSIKJmd0
OwomZ3Q7ICBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9rbXNjdWJlLmM7YmVnaW5saW5lPTE7
ZW5kbGluZT0yMzttZDU9OGIzMDlkNGVlNjdiNzMxNWZmNzM4MTI3MGRkNjMxZmIiCiZndDsKJmd0
OyAtU1JDUkVWID0gIjQ2N2U4NmM1Y2JlYjJhMjA1MWIzMWNlMmMyNDBkNmRkZjViYzMxMTIiCiZn
dDsgK1NSQ1JFViA9ICJiMmY5N2Y1M2UwMWUwN2E5MjA3NjFlNWQzZTNiYTIyODk4Yjc5NGE0Igom
Z3Q7ICBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNjdWJl
O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAomZ3Q7ICAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWN1YmUtZ2VhcnMtQ2hhbmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBhdGNoIFwK
Jmd0OyAgICAgICAgICAgICAiCiZndDsKJmd0OyAKJmd0Owo8L3A+PC9wcmU+PHByZT4tPS09LT0t
PS09LT0tPS09LT0tPS09LQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4KVmlldy9SZXBseSBPbmxpbmUgKCMyMDYwMzApOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIwNjAzMApNdXRlIFRo
aXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDkwNjA5MzUvODUx
NTkxMgpHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZwpVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvdW5zdWIgW3B1cnVzaG90dGFtMjcua3VtYXJAbGdlLmNvbV0KLT0tPS09
LT0tPS09LT0tPS09LT0tPS0KCjwvcHJlPjxwPjxicj48L3A+PC9ib2R5PjwvaHRtbD4=

