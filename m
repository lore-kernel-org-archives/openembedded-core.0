Return-Path: <joraj@efficios.com>
X-Greylist: delayed 497 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Apr 2019 01:20:00 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 27A697D222
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 01:20:00 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 425EA1D8796;
	Wed, 17 Apr 2019 21:11:44 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id Bys9wl9TXocS; Wed, 17 Apr 2019 21:11:43 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 677671D8790;
	Wed, 17 Apr 2019 21:11:43 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 677671D8790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1555549903;
	bh=Cqf3JgyT8tdTZlLuTIhlmB2jSZjf2rryNgG7U2zqXRI=;
	h=Date:Message-ID:From:To:MIME-Version;
	b=aZMj6/o7+WTraqlxLt4W6J4TGx7YJAIPkrOCWUOcBvreotavysQMeKnm8AavRL7Tv
	ePTcGqaojzt2PnB197hR2mdD7DN8n0F8ttFt98OmvPvQFAt0vNqHeCTqfgQC18ZEZw
	bqN4bPom7aa8WOI5aJ3CaTu7lOZM7QsUSlTs0omSdQ2LA6zdy5y+VcSya+u3Bhdl2N
	RmjKIwWvOWUiY2dP+qVvOQGqF+mkhj/KnH5zJkOA/3kwLN5FWGKekJcCQfbrSxpCFC
	/1maUZRfUan4a16nWPyU1Yo0u0ZINZ1Mu6Hsh9Hm+Pu9VJQa4LdZMt+jooL/9HKIrK
	UgnGF5y/sYztg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id iEchWeonsIQF; Wed, 17 Apr 2019 21:11:43 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
	by mail.efficios.com (Postfix) with ESMTP id 551F91D878B;
	Wed, 17 Apr 2019 21:11:43 -0400 (EDT)
Date: Wed, 17 Apr 2019 21:11:43 -0400 (EDT)
Message-ID: <60861186.775.1555549903228.JavaMail.zimbra@mail02>
X-Android-Message-ID: <e06ad013-8468-49b3-b1e6-45fdc29fa651@email.android.com>
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
X-ZxMobile-Command: SendMail
X-ZxMobile-Version: 2.16.0
X-Originating-IP: [::ffff:107.159.43.215]
X-Mailer: Zimbra 8.8.12_GA_3794
Thread-Index: d+jqD47FvpaFWcrvVIKcnddiWWoN+A==
Thread-Topic: Recipes with ptest dependency problems
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with ptest dependency problems
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
X-List-Received-Date: Thu, 18 Apr 2019 01:20:00 -0000
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9J2F1dG8nPjxkaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEFwciAxNywgMjAxOSA1OjU2IFBNLCBSaWNoYXJkIFB1
cmRpZSAmbHQ7cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZyZndDsgd3JvdGU6PGJy
IHR5cGU9ImF0dHJpYnV0aW9uIj48YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJn
aW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4
Ij48ZGl2PkkgbWVudGlvbmVkIGRpZmZlcmVuY2VzIGluIG51bWJlcnMgb2YgcGFzcy9mYWlsIGRl
cGVuZGluZyBvbiB3aGljaDxicj5pbWFnZSB5b3UgaW5zdGFsbCBwdGVzdHMgaW50by4gVGhlIHJl
Y2lwZXMgd2hpY2ggaGF2ZSB0aGUgaXNzdWVzIGFuZDxicj50aGUgbnVtYmVycyBhcmU6PGJyPjxi
cj5jb3JlLWltYWdlLXNhdG8gd2l0aCBwdGVzdCBpbnN0YWxsZWQ6PGJyPjxicj5SZWNpcGUgICAg
ICAgICAgICAgICAgICAgICAgIHwgUGFzc2VkICAgICAgfCBGYWlsZWQgICB8IFNraXBwZWQgICB8
IDxicj48YnI+ZGlmZnV0aWxzICAgICAgICAgICAgICAgICAgICB8IDIwICAgICAgICAgIHwgMCAg
ICAgICAgfCAxICAgICAgICAgfCA8YnI+ZWxmdXRpbHMgICAgICAgICAgICAgICAgICAgICB8IDMx
ICAgICAgICAgIHwgNiAgICAgICAgfCAxNjYgICAgICAgfCA8YnI+ZmxleCAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDAgICAgICAgICAgIHwgMCAgICAgICAgfCAwICAgICAgICAgfCA8YnI+Z3pp
cCAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgICAgICAgICAgIHwgMTkgICAgICAgfCAwICAg
ICAgICAgfCA8YnI+bGlieG1sLXBhcnNlci1wZXJsICAgICAgICAgICB8IDAgICAgICAgICAgIHwg
MTUgICAgICAgfCAwICAgICAgICAgfCA8YnI+bHR0bmctdG9vbHMgICAgICAgICAgICAgICAgICB8
IDMzOTcgICAgICAgIHwgNjI2ICAgICAgfCAxICAgICAgICAgfCBUPGJyPjwvZGl2PjwvYmxvY2tx
dW90ZT48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGly
PSJhdXRvIj5EbyB5b3UgaGF2ZSBhIGxpbmsgdG8gdGhpcyBydW4gbG9ncz88L2Rpdj48ZGl2IGRp
cj0iYXV0byI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3Jk
ZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2PjwvZGl2PjwvYmxv
Y2txdW90ZT48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxkaXYgY2xhc3M9ImdtYWlsX2V4
dHJhIj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBz
dHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGlu
Zy1sZWZ0OjFleCI+PGRpdj5uZXR0bGUgICAgICAgICAgICAgICAgICAgICAgIHwgOTUgICAgICAg
ICAgfCAyICAgICAgICB8IDIgICAgICAgICB8IDxicj5vcGVuc3NoICAgICAgICAgICAgICAgICAg
ICAgIHwgMCAgICAgICAgICAgfCAwICAgICAgICB8IDEgICAgICAgICB8IDxicj5wZXJsICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjQyNSAgICAgICAgfCAyMCAgICAgICB8IDIzNSAgICAgICB8
IDxicj5weXRob24gICAgICAgICAgICAgICAgICAgICAgIHwgMzA0ICAgICAgICAgfCA2ICAgICAg
ICB8IDM5ICAgICAgICB8IDxicj5weXRob24zICAgICAgICAgICAgICAgICAgICAgIHwgMzAzMjEg
ICAgICAgfCAyICAgICAgICB8IDEwMTkgICAgICB8IDxicj5xdWlsdCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMjMgICAgICAgICAgfCAzNCAgICAgICB8IDAgICAgICAgICB8IDxicj50Y2wgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTQ4ICAgICAgICAgfCAxICAgICAgICB8IDAgICAgICAg
ICB8IDxicj51dGlsLWxpbnV4ICAgICAgICAgICAgICAgICAgIHwgMzc4ICAgICAgICAgfCAyICAg
ICAgICB8IDU4ICAgICAgICB8IDxicj52YWxncmluZCAgICAgICAgICAgICAgICAgICAgIHwgMCAg
ICAgICAgICAgfCAwICAgICAgICB8IDAgICAgICAgICB8IDxicj48YnI+Y29yZS1pbWFnZS1zYXRv
LXNkayB3aXRoIHB0ZXN0IGluc3RhbGxlZDo8YnI+PGJyPlJlY2lwZSAgICAgICAgICAgICAgICAg
ICAgICAgfCBQYXNzZWQgICAgICB8IEZhaWxlZCAgIHwgU2tpcHBlZCAgIHwgPGJyPjxicj5kaWZm
dXRpbHMgICAgICAgICAgICAgICAgICAgIHwgMjEgICAgICAgICAgfCAwICAgICAgICB8IDAgICAg
ICAgICB8IDxicj5lbGZ1dGlscyAgICAgICAgICAgICAgICAgICAgIHwgMzEgICAgICAgICAgfCA0
ICAgICAgICB8IDE2OCAgICAgICB8IDxicj5mbGV4ICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MTE0ICAgICAgICAgfCAwICAgICAgICB8IDAgICAgICAgICB8IDxicj5nemlwICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMjIgICAgICAgICAgfCAwICAgICAgICB8IDAgICAgICAgICB8IDxicj5s
aWJ4bWwtcGFyc2VyLXBlcmwgICAgICAgICAgIHwgMTUgICAgICAgICAgfCAwICAgICAgICB8IDAg
ICAgICAgICB8IDxicj5sdHRuZy10b29scyAgICAgICAgICAgICAgICAgIHwgNDY5MyAgICAgICAg
fCAxICAgICAgICB8IDQxMiAgICAgICB8IDxicj5uZXR0bGUgICAgICAgICAgICAgICAgICAgICAg
IHwgOTYgICAgICAgICAgfCAxICAgICAgICB8IDIgICAgICAgICB8IDxicj5vcGVuc3NoICAgICAg
ICAgICAgICAgICAgICAgIHwgNjcgICAgICAgICAgfCAwICAgICAgICB8IDMgICAgICAgICB8IDxi
cj5wZXJsICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjQzMCAgICAgICAgfCAxOSAgICAgICB8
IDIzMSAgICAgICB8IDxicj5weXRob24gICAgICAgICAgICAgICAgICAgICAgIHwgMTMxICAgICAg
ICAgfCAxICAgICAgICB8IDE3ICAgICAgICB8IDxicj5weXRob24zICAgICAgICAgICAgICAgICAg
ICAgIHwgMzAzMjkgICAgICAgfCAyICAgICAgICB8IDEwMTEgICAgICB8IDxicj5xdWlsdCAgICAg
ICAgICAgICAgICAgICAgICAgIHwgNTcgICAgICAgICAgfCAwICAgICAgICB8IDAgICAgICAgICB8
IDxicj50Y2wgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQ5ICAgICAgICAgfCAwICAgICAg
ICB8IDAgICAgICAgICB8IDxicj51dGlsLWxpbnV4ICAgICAgICAgICAgICAgICAgIHwgNDczICAg
ICAgICAgfCAyICAgICAgICB8IDUyICAgICAgICB8IDxicj52YWxncmluZCAgICAgICAgICAgICAg
ICAgICAgIHwgMjk3ICAgICAgICAgfCAyNTEgICAgICB8IDMxICAgICAgICB8IDxicj48YnI+SSBh
cHByZWNpYXRlIHNvbWUgb2YgdGhlIG51bWJlcnMgZG9uJ3QgYWRkIHVwIGUuZy4gdmFsZ3JpbmQg
c2tpcHMgMDxicj50ZXN0cz8gb3IgdGhlIHV0aWwtbGludXggc2tpcCBjb3VudHMuIEkgY3JvcHBl
ZCB0aGUgdGltZSB0YWtlbiBjb3VudHM8YnI+b3V0IGFzIHRoZXkgY29uZnVzZSB0aGUgZGlmZiBv
dGhlciB0aGFuIHRvIG5vdGUgdGhlIHRpbWVvdXQvaGFuZyBpbjxicj5sdHRuZy10b29scy48YnI+
PGJyPldlIHByb2JhYmx5IG5lZWQgYnVnemlsbGEgZW50cmllcyBmb3IgZWFjaCBvbmUgb2YgdGhl
c2UgdG8gbG9vayBpbnRvPGJyPmFuZCBmaXggdGhlIHB0ZXN0IHBhY2thZ2UgZGVwZW5kZW5jaWVz
IHNvIHRoZSBwYXNzL2ZhaWwgY291bnRzIGFyZSB0aGU8YnI+c2FtZSBpbiBhIGNvcmUtaW1hZ2Ut
c2F0byB0byBjb3JlLWltYWdlLXNhdG8tc2RrLjxicj48YnI+Q2hlZXJzLDxicj48YnI+UmljaGFy
ZDxicj48YnI+LS0gPGJyPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyPk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdDxicj5PcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGJyPmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmU8YnI+PC9kaXY+PC9ibG9ja3F1
b3RlPjwvZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj4=

